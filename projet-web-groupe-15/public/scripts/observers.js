const faders = document.querySelectorAll(".fade-in");

const appearOnScroll = new IntersectionObserver((entries, appearOnScroll) => {
    entries.forEach(entry => {
        if (!entry.isIntersecting) {
            return;
        } else {
            entry.target.classList.add("appear");
            appearOnScroll.unobserve(entry.target);
        }
    });
});

faders.forEach(fader => {
    appearOnScroll.observe(fader);
});
