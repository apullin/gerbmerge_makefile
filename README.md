germerge Makefile 
====================

This repository provides a useful Makefile for automatically merging boards together in a panel by use of germerge and a simple layout description format.
The makefile will 


This Makefile and the gerbmerge approach is very useful for sending out boards for manufacture in small volume. Several designs can be quickly incorporated into a single panel. EaglePCB has very poor support for panelizing boards, and gerber-centric tools for this task are expensive and not available to hobbyists and academics.

The "33each" and "66each" low cost/low volume processes offered by AdvancedPCB are specifically targeted.

Howto:
 - Forthcoming, a tutorial and examples will be put here.

Dependencies:
 - Linux or OSX (I'm sure all platforms can be supported, with effort)
 - EaglePCB
 - gerbmerge 
   gerbmerge has apparently been abandoned by the original author. The Biomimetic Millisystems Lab from UC Berkeley has made the latest fixes to it, and has potentially taken stewardship of the code:
   https://github.com/apullin/gerbmerge-1.8.git
   (this repo will be moved to the 'biomimetics' github user at some point in the future)