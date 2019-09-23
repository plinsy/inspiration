jQuery(document).ready(function($) {
    $(`.alert`).click(function(event) {
        /* Act on the event */
        $(this).fadeOut('slow', function() {
            $(this).remove();
        });
    });

    setTimeout(function() {
        $(`.alert`).fadeOut('slow', function() {
            $(this).remove();
        });
    }, 5000);
});