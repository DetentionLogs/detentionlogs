/* -------------------------------------------------------------------------------
 * Detention Logs gruntfile v0.1
 *
 * http://detentionlogs.c
 * -------------------------------------------------------------------------------*/

module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

/* -------------------------------------------------------------------------------
 * compass
 *
 * https://github.com/gruntjs/grunt-contrib-compass
 * -------------------------------------------------------------------------------*/

        compass: {
          dist: {
            options: {
              sassDir: 'app/assets/stylesheets/',
              cssDir: 'app/assets/stylesheets/build/',
              environment: 'production',
              outputStyle: 'expanded'
            }
          }
        },


/* -------------------------------------------------------------------------------
 * svgmin
 *
 * https://github.com/sindresorhus/grunt-svgmin
 * -------------------------------------------------------------------------------*/

        svgmin: {
            options: {
                plugins: [{
                    removeViewBox: false
                }]
            },

            dist: {
                files: [{
                    expand: true,
                    cwd: 'app/assets/images/icons/svg',
                    src: '*.svg',
                    dest: 'app/assets/images/icons/svg/build',
                    ext: '.colors-888-fff.svg'
                }]
            }
        },

/* -------------------------------------------------------------------------------
 * grunticon
 *
 * https://github.com/filamentgroup/grunticon
 * -------------------------------------------------------------------------------*/

        grunticon: {
            icons: {
                files: [{
                    expand: true,
                    cwd: 'app/assets/images/icons/svg/build',
                    src: '*.svg',
                    dest: 'public/images/icons/svg/'
                }]
            }
        },

/* -------------------------------------------------------------------------------
 * autoprefixer
 *
 * https://github.com/nDmitry/grunt-autoprefixer
 * -------------------------------------------------------------------------------*/

        autoprefixer: {
            options: {
                browsers: ['last 2 version', '> 5%', 'ie 8', 'ie 7']
            },

            multiple_files: {
                expand: true,
                flatten: true,
                src: 'app/assets/stylesheets/build/style.css',
                dest: 'app/assets/stylesheets/build/prefixed/'
            }
        },

/* -------------------------------------------------------------------------------
 * cssmin
 *
 * https://github.com/gruntjs/grunt-contrib-cssmin

TO DO: minify svg css
// 'img/icons/build/icons.data.png.min.css': ['img/icons/build/icons.data.png.css'],
// 'img/icons/build/icons.data.svg.min.css': ['img/icons/build/icons.data.svg.css'],
// 'img/icons/build/icons.fallback.min.css': ['img/icons/build/icons.fallback.css']

 * -------------------------------------------------------------------------------*/

        cssmin: {
            minify: {
                files: {
                    'app/assets/stylesheets/build/min/style.min.css': ['app/assets/stylesheets/build/prefixed/style.css'],
                    'public/stylesheets/style.min.css': ['app/assets/stylesheets/build/prefixed/style.css']
                }
            }
        },

/* -------------------------------------------------------------------------------
 * jshint
 *
 * https://github.com/gruntjs/grunt-contrib-jshint
 * -------------------------------------------------------------------------------*/

        jshint: {
            beforeconcat: ['app/assets/javascripts/global.js']
        },

/* -------------------------------------------------------------------------------
 * concat
 *
 * https://github.com/gruntjs/grunt-contrib-concat
 * -------------------------------------------------------------------------------*/

        concat: {
            global: {
                src: [
                    'app/assets/javascripts/*.js'
               ],

                dest: 'app/assets/javascripts/concat/global.js',
            },

            polyfill: {
                src: [
                    'vendor/assets/javascripts/html5shiv.js',
                    'vendor/assets/javascripts/respond.src.js'
               ],

                dest: 'app/assets/javascripts/concat/polyfill.js',
            },

            jquery: {
                src: [
                    'vendor/assets/javascripts/jquery.js'
               ],

                dest: 'app/assets/javascripts/concat/jquery.js',
            },

            jquery_ujs: {
                src: [
                    'vendor/assets/javascripts/jquery_ujs.js'
               ],

                dest: 'app/assets/javascripts/concat/jquery_ujs.js',
            }
        },

/* -------------------------------------------------------------------------------
 * uglify
 *
 * https://github.com/gruntjs/grunt-contrib-uglify
 * -------------------------------------------------------------------------------*/

        uglify: {
            global: {
                src: 'app/assets/javascripts/concat/global.js',
                dest: 'public/javascripts/global.min.js'
            },

            polyfill: {
                src: 'app/assets/javascripts/concat/polyfill.js',
                dest: 'public/javascripts/polyfill.min.js'
            },

            jquery: {
                src: 'app/assets/javascripts/concat/jquery.js',
                dest: 'public/javascripts/jquery.min.js'
            },

            jquery_ujs: {
                src: 'app/assets/javascripts/concat/jquery_ujs.js',
                dest: 'public/javascripts/jquery_ujs.min.js'
            }
        },

/* -------------------------------------------------------------------------------
 * watch
 *
 * https://github.com/gruntjs/grunt-contrib-watch
 * -------------------------------------------------------------------------------*/

        watch: {
            options: {
                livereload: true,
            },

            css: {
                files: ['app/assets/**/*'],
                tasks: ['compass', 'autoprefixer', 'cssmin', 'jshint', 'concat', 'uglify'],
                options: {
                    spawn: false
                }
            }
        }
    });

/* -------------------------------------------------------------------------------
 * https://github.com/sindresorhus/load-grunt-tasks
 * -------------------------------------------------------------------------------*/

    require('load-grunt-tasks')(grunt);

    grunt.registerTask('default', ['compass', 'autoprefixer', 'cssmin', 'jshint', 'concat', 'uglify']);
    grunt.registerTask('dev', ['watch']);
};
