Tech Manifesto
--------------
There is always a trade off between speed and quality.  Sometimes you need to get shit done. Fast. To do stuff fast you need to be sittign on good code.  Good code allows speed.  Speed creates bad code.  To reconcile this idea we like to think of development in what we're goingot call a tick tock cycle.  Intel has a process where every generation they iterate in one of two ways.  A decrease in teh size of the transistors on the chip (tick) and an update to the architecture the chip is using (tock).  They stagger the priority of the two major goals of the product.  Our priorites are Speed of development and quality of code.  Our tick is to get it done.  Our tock is to make it high quality.  If we maintain this and schedule time for the tock we can hit both development goals.  in short, Don't skip the fuckign tick.  This is the same conecpt as build test refactor but is in a larger cycle.  Our tock goals are near 100% code coverage, all features and process documented, 100% code usage (no dead code), and high quality of code as judged by static coe analyzers.  Our speed goal is as fast as the business needs.
Practically,  We work in 4/2 day sprints. 4 days for a writing (tick).  2 days for cleangin up (tock).  Choose the amount of work that needs to get done in the sprint and hit the deadline.
Always, maintain all the business logic in a human readable/editable document.  All aspects fo the buisness should be described in fair detail in these docs.
If you can't deploy in under a minute you're doing it wrong