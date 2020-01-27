require(["jquery",
        "splunkjs/ready!",
        "bootstrap.popover",
        "bootstrap.tooltip"
    ],
    function(
        $, Ready) {
            
        $("[data-popover]").attr("data-toggle", "popover").popover()
        $("[data-tooltip]").attr("data-toggle", "tooltip").tooltip()
    })
//# sourceURL=ex36-tooltips-and-popovers.js