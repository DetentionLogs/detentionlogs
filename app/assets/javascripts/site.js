/* Glossary replacer  */
		$(document).ready(function(){
			
		    $(".incident-item, .incident").each(
				
				function(){
					var redacted = $(this).html();
					redacted = redacted.replace(/s\.\s*47F\(1\)/g, '<abbr class="redacted" title="text redacted under section 47F(1) of the FOI Act ###">s. 47F(1)</abbr>');
					$(this).html(redacted);
					
					var observation = $(this).html();
					observation = observation.replace(/\bobs\b/i, '<abbr title="observation">OBS</abbr>'); //this should be fixed replace that actual text, so as to keep the capitalisation used by the original author. 
					$(this).html(observation);
					
					var idc = $(this).html();
					idc = idc.replace(/\bidc\b/i, '<abbr title="Immigration Detention Centre">IDC</abbr>'); //this should be fixed replace that actual text, so as to keep the capitalisation used by the original author. 
					$(this).html(idc);
					
					var apod = $(this).html();
					apod = apod.replace(/\bapod\b/i, '<abbr title="Alternative Place of Detention">APOD</abbr>'); //this should be fixed replace that actual text, so as to keep the capitalisation used by the original author. 
					$(this).html(apod);
					
					var ita = $(this).html();
					ita = ita.replace(/\bita\b/i, '<abbr title="Immigration Transit Accommodation">ITA</abbr>'); //this should be fixed replace that actual text, so as to keep the capitalisation used by the original author. 
					$(this).html(ita);
					
					var ihr = $(this).html();
					ihr = ihr.replace(/\bihr\b/i, '<abbr title="Immigration Residential Housing">IHR</abbr>'); //this should be fixed replace that actual text, so as to keep the capitalisation used by the original author. 
					$(this).html(ihr);
				})
			
			
 		});

	 /* Collapsable content */
	
		/*
		 * --------------------------------------------------------------------
		 * jQuery collapsible plugin
		 * Author: Scott Jehl, scott@filamentgroup.com
		 * Copyright (c) 2009 Filament Group 
		 * licensed under MIT (filamentgroup.com/examples/mit-license.txt)
		 * --------------------------------------------------------------------
		 * 
		 * Arrow-key and collapsed to begin additions by James Frank, 2011
		 * 
		 * --------------------------------------------------------------------
		 */
		
		$.fn.collapsible = function(collapsed){
			return $(this).each(function(){
			
				//define
				var collapsibleHeading = $(this);
				var collapsibleContent = collapsibleHeading.next();
				
				//modify markup & attributes
				collapsibleHeading.addClass('collapsible-heading')
					.prepend('<span class="collapsible-heading-status"></span>')
					.wrapInner('<a href="#" class="collapsible-heading-toggle"></a>');
					
				collapsibleContent.addClass('collapsible-content');
				
				//events
				collapsibleHeading	
					.bind('collapse', function(){
						$(this)
							.addClass('collapsible-heading-collapsed')
							.find('.collapsible-heading-status').text('Show ');
												
						collapsibleContent.slideUp(function(){
							$(this).addClass('collapsible-content-collapsed').removeAttr('style').attr('aria-hidden',true);
						});
					})
					.bind('expand', function(){
						$(this)
							.removeClass('collapsible-heading-collapsed')
							.find('.collapsible-heading-status').text('Hide ');
												
						collapsibleContent
							.slideDown(function(){
								$(this).removeClass('collapsible-content-collapsed').removeAttr('style').attr('aria-hidden',false);
							});
					})
					.click(function(){ 
						if( $(this).is('.collapsible-heading-collapsed') ){
							$(this).trigger('expand'); 
						}	
						else {
							$(this).trigger('collapse'); 
						}
						return false;
					})
					.keydown(function(e){ 
						var code = (e.keyCode ? e.keyCode : e.which);
						switch (code) {
							case 13:
								$(this).click(); 
								break;
							case 39:
								$(this).trigger('expand'); 
								break;
							case 37:
								$(this).trigger('collapse'); 
								break;	
							default:
								return true;
								break;
						}
						return false;
					});
				
				if(collapsed)
					collapsibleHeading.trigger('collapse');
			});	
			
		};
		$(document).ready(function(){
			$('.add-details').collapsible(true);
		});