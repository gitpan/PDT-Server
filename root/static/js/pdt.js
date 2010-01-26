$(document).ready(function() {
    $( '#toggle_options' ).bind( 'change', function(e) {
        console.log( 'xxx' );
        $( '.optional' ).slideToggle( '2' );
    });
});
