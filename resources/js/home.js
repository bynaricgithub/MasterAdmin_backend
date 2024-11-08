// Slider
$(document).ready(function () {
    $(".sliderCarousal").owlCarousel({
        loop: true,
        dots: false,
        margin: 10,
        nav: true, // Enable navigation
        navText: [
            '<i class="fas fa-chevron-left"></i>',
            '<i class="fas fa-chevron-right"></i>',
        ],
        responsive: {
            0: { items: 1 },
        },
    });
});

// Notice Board
$(document).ready(function () {
    let scrollSpeed = 30; // Adjust speed for marquee effect

    function startMarquee() {
        let noticeboardHeight = $(".noticeboard").height();
        let scroller = $("#noticeScroller");
        let scrollerHeight = scroller.height();

        scroller.animate(
            { top: -scrollerHeight + "px" }, // Scroll up to the height of the scroller
            (scrollerHeight + noticeboardHeight) * scrollSpeed, // Duration for the scroll effect
            "linear", // Continuous linear scrolling
            function () {
                // Reset to original position after scrolling is complete
                scroller.css("top", noticeboardHeight + "px");
                // Restart scrolling
                startMarquee();
            }
        );
    }

    // Start scrolling
    startMarquee();

    // Pause scrolling on hover and resume when the mouse leaves
    $(".noticeboard").hover(
        function () {
            $("#noticeScroller").stop(); // Stop the animation
        },
        function () {
            startMarquee(); // Resume the animation
        }
    );

    // Custom scroll behavior: Control scroll direction with the mouse wheel
    $(".noticeboard").on("mousewheel DOMMouseScroll", function (e) {
        e.preventDefault(); // Prevent default scrolling behavior
        let delta = e.originalEvent.wheelDelta || -e.originalEvent.detail;

        if (delta > 0) {
            // Scroll up faster on mousewheel up
            $("#noticeScroller")
                .stop()
                .animate({ top: "+=20px" }, 200, "linear");
        } else {
            // Scroll down faster on mousewheel down
            $("#noticeScroller")
                .stop()
                .animate({ top: "-=20px" }, 200, "linear");
        }
    });
});
