# Goalset, Notes & Scribblings

I am interested in reliable computing.  Stuff that works all the time and live update. 

This has led to an interest in Minix3 (and Genode/seL4, ...).

I had thought to port Minix3 to the Raspberry Pi 3 (I prefer ARM for low power consumption) but found divice drivers to be highly complex and frequently closed source.

This led me to look for reasonable working code ecosystems for rpi3 and I found Ultibo.org.

One thing I like about Smalltalk is that one is always working with a live, running system.  As the Ultibo and FreePascal folks have already done the heavy lifting with respect to drivers for the rpi3, it makes more sense to me to start with a successful, and delightful, working code ecosystem and evolve features into a Minix3 drop-in replacement.

As the Minix3 kernel is small and has a clean interface, one hopes that starting with a language base with better abstractions (Free/Object Pacal vs C) should yield a better starting point for a user comprehensible system.  The pole star goal is a reliable system which can be understood in its entirely by an advanced student and reliably enhanced.

We shall see..

The first big step in the roadmap is to implement user-land: user virtual memory space, processes, and kernel calls.

Then one should be able to incrementally "lift" drivers from kernel space into user space (think "rump kernel").

[..to be continued..]
