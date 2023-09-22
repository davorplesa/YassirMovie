#  Yassir Assignment by Davor Plesa

MVVM architecture is used to support dependency injection and automated UI testing.
The assignment is simple enough, and didn't require testing, so MVC could have been used as well, but I'm used to MVVM and wanted to make it future proof.

I decided on using SwiftUI over UIKit, as the proposed design is simple enough. If there was a complex interface which required pixel-perfect animations I would've chosen UIKit.

I added a tagline text on the details screen on my own, to warrant the implementation of additional details API call. All data required by the specification is already available from the first API call. 

In order to not spend too much time on the assignment, the following shortcuts were made:
- Alert is shown on connection or parsing errors, but no retry is implemented.
- No custom errors were created, native errors are propagated to the user.
- No unit tests were written.

