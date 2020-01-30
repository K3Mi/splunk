require([
     "splunkjs/mvc",
     "splunkjs/mvc/tokenutils",
     "jquery",
     "splunkjs/mvc/searchmanager",
     "splunkjs/ready!",
     "splunkjs/mvc/simplexml/ready!"    
     ],
     function(
         mvc,
         TokenUtils,
         $,
         SearchManager
         ) {
             //jQuery to access Panel with ID and use mvc.Components.get() function to get all Submitted Tokens.
             //On mouseover() event set the show token for the Tooltip
             $('#panel1').on("mouseover",function(){
                 var tokens = mvc.Components.get("submitted");
                 tokens.set("tokToolTipShow1", "true");
             });
             //On mouseout() event unset the show token for the Tooltip to hide the same.
             $('#panel1').on("mouseout",function(){
                 var tokens = mvc.Components.get("submitted");        
                 tokens.unset("tokToolTipShow1");
             });
         }
     );