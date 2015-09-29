
/*________________________________________________________________
DROP DOWN LIST - INIT
________________________________________________________________*/
var sbox = $("#page select");
renderSelectBox(sbox);
function renderSelectBox(sbox) {
    for(s = 0; s < sbox.length; s++) {
        sb = $(sbox[s]);
        if(!sb.next().hasClass('ui-dropdownchecklist')) { //-- Check if already not created
            multiple = (sb.attr('multiple') == undefined) ? false : true;
            etext = $('option:selected', sb).text();
            width = (sb.attr('width') == undefined) ? 150 : sb.attr('width'); //150 - min width
            var dd = sb.dropdownchecklist({
                	emptyText: ""+etext, 
                firstItemChecksAll: false,
                closeRadioOnClick: true,
                positionHow: 'absolute',
                width: width,
                forceMultiple: multiple
            });
            //-- add classes	
            dd.next('.ui-dropdownchecklist').addClass(sb.attr('class'))
        }
    }
}
/*________________________________________________________________
VZ TIP - INIT
________________________________________________________________*/
renderTips($('body'));
function renderTips(obj) {
    // Define our positioning and style arrays
    var opposites = ['top', 'topLeft', 'topRight', 'bottom', 'bottomLeft', 'bottomRight', 'right', 'rightTop', 'rightBottom', 'left', 'leftTop', 'leftBottom'];
    var at = ['bottom center', 'bottom left', 'bottom right', 'top center', 'top left', 'top right', 'left center', 'left top', 'left bottom', 'right center', 'right top', 'right bottom', 'center']
    my = ['top center', 'top left', 'top right', 'bottom center', 'bottom left', 'bottom right', 'right center', 'right top', 'right bottom', 'left center', 'left top', 'left bottom', 'center']
    styles = ['red', 'blue', 'dark', 'light', 'green', 'jtools', 'plain', 'youtube', 'cluetip', 'tipsy', 'tipped'];
    var i, target, content, title, clickable, ready, closebtn, hidewhen, solo, timer, closeafter;
    $('.vztip', obj).each(function(){
        for(i = 0; i <= opposites.length; i++) {
            //-- Check if tip matches with specific class
            if($(this).hasClass(opposites[i])) {
                //- Check it has rel attribute or not.
                if($(this).attr("rel") == undefined || $(this).attr("rel") == "") {
                    target = false
                } else {
                    target = $("#" + $(this).attr('rel')); //-- If specified any rel id, then it will load the content from id div
                }
                //-- Check it has ready function
                if($(this).attr("ready") == undefined || $(this).attr("ready") == "") {
                    ready = false;
                } else {
                    ready = $(this).attr('ready'); //-- Tooltip will show's when page is ready
                }
                //-- Show when you click on tooltip or on mouseover
                clickable = ($(this).hasClass('click')) ? 'click' : 'mouseover';
                hidewhen = "mouseleave"; //-- Event when popup needs to hidden
                solo = true; //-- All other tips will be hide and only this tip will display
                content = (target) ? target : $(this).nextAll('.tip_content:first');
                //-- Tooltip with Title
                title = (content.attr('title') == undefined) ? false : content.attr('title');
                text = (content.html() == '') ? false : content.html(); //- check content is not null
                text = (!text) ? $(this).attr('title') : text;
                text = (text == undefined) ? $(this).attr('oldtitle') : text;
                //text = (content.attr('title') == undefined && content.html() == '') ? title : $(this).attr("oldtitle"); //- check content is not null
                /*if(content.attr('title') == undefined && content.html() == ''){
					text = 
				}*/
                //-- Check it has close attribute
                if(content.attr("close") == undefined || content.attr("close") == "") {
                    closebtn = false;
                } else {
                    closebtn = content.attr("close"); //-- If specified any rel id, then it will load the content from id div
                    hidewhen = false;
                }
                if(content.attr("mouse") == undefined || content.attr("mouse") == "") {
                    mouse = false;
                    postarget = false;
                } else {
                    mouse = content.attr("mouse"); //-- If specified any rel id, then it will load the content from id div
                    //mouse = mouse
                    postarget = (mouse) ? "mouse" : false;
                }
                //-- Check it has close attribute
                if(content.attr("closeafter") == undefined || content.attr("closeafter") == "") {
                    timer = false;
                } else {
                    closeafter = content.attr("closeafter"); //-- If specified any rel id, then it will load the content from id div
                    timer = true;
                }
                ady = (content.attr("y")) ? content.attr("y") : 0;
                adx = (content.attr("x")) ? content.attr("x") : 0;
                ady = ($(this).attr("y")) ? $(this).attr("y") : ady;
                adx = ($(this).attr("x")) ? $(this).attr("x") : adx;
                h = 12;
                w = 6;
                tipoffset = (i == 0 || i == 3 || i == 6 || i == 9) ? 0 : 4;
                if(i > 5) {
                    width = w;
                    height = h;
                } else {
                    width = h;
                    height = w;
                }
                // width = ;
                //--------------- TIP RENDERS FROM HERE ---------------  //
                $(this).qtip({
                    content: {
                        text: text,
                        title: {
                            text: title,
                            button: closebtn
                        }
                    },
                    // prerender: true,
                    position: {
                        my: at[i],
                        // Use the corner...
                        at: my[i] // ...and opposite corner
                        ,
                        viewport: $(window) //-- Adjust with screen
                        ,
                        target: postarget,
                        adjust: {
                            mouse: mouse,
                            screen: true,
                            y: Number(ady),
                            x: Number(adx)
                        }
                    },
                    show: {
                        event: clickable,
                        // Don't specify a show event...
                        ready: ready,
                        // ... but show the tooltip when ready
                        solo: solo // ...and hide all other tooltips...
                        ,
                        effect: function (offset) {
                            $(this).css('display', 'block'); // "this" refers to the tooltip
                        }
                    },
                    hide: {
                        fixed: true,
                        event: hidewhen,
                        delay: 50,
                        effect: function (offset) {
                            $(this).slideDown(100); // "this" refers to the tooltip
                        } /*,delay: 10*/
                    } // Don't specify a hide event either!
                    ,
                    style: {
                        classes: 'ui-tooltip-dark ui-tooltip-shadow',
                        tip: {
                            width: width,
                            height: height,
                            offset: tipoffset,
                            border: 1
                        }
                    },
                    events: {
                        /* render: function (event, api) {
                            afterCreation(event, api)
                            //
                        }*/
                    }
                    //}
                }); //-- Tip Ends here
                function afterCreation(e, api) {
                    if(timer) {
                        setTimeout(api.hide, closeafter); // Hide after 1 second
                    }
                }
            } // if ends here
        } //- For Ends here
    });
}
//});


/*________________________________________________________________
Modal popup - INIT
________________________________________________________________*/
$(window).load(function(){
mp = $(".modalpopup");
renderModals(mp)
function renderModals(mp) {
    for(ml = 0; ml < mp.length; ml++) {
        m = $(mp[ml])
        pwidth = (m.attr('pwidth') == undefined) ? 500 : m.attr('pwidth');
        pheight = (m.attr('pheight') == undefined) ? 500 : m.attr('pheight');
        maxHeight = (pheight > 600) ? pheight : 600;
        m.modalpopup({
            innerWidth: pwidth,
            innerHeight: pheight,
            maxHeight: maxHeight,
            onComplete: function(){
				setTimeout( "$('#cboxTitle').show();",4000 );
								}
        });
    }
}
});

