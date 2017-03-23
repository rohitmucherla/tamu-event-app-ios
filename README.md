TAMU Event App Project
===

Build for the iOS-Swift version of the TAMU Event App. 
Swift 3.0, Xcode 8.2.1

How To Build The App
--------------------

#### Pull the repo
Clone the master branch from the repo from github found at https://github.com/rohitmucherla/tamu-event-app-ios.git

#### (if Pods are installed)
Go into the root directory where "Podfile" is located and in terminal type "pod install".
From there, xcworkspace will be created. 
Work in the workspace after this.

#### (if Pods are NOT installed) Open 'MedProj.xcodeproj'
The workspace will include the latest version on master

#### Build the app
The app should build and run after pressing the 'run' button on the top left of Xcode

## Development Workflow

* The `master` branch at any time represents a stable (and tested) version of the code base.
* All development work should be performed in feature branches. In most cases, feature branches will be branched off of the `master` branch. Naming of the feature branches is up to the developer. Using your initials is helpful so we know who is working where, but not crucial. 
(Ex: `mm-feature_name`)
* Pull from `master` often, and especially before submitting a pull request to make sure your feature branch has the latest changes. In Xcode, utilize the GUI and go to Source Control -> Pull so that you can easily handle merge conflicts. Remember to do a git fetch before doing so.
* [Milestones](hhttps://github.com/rohitmucherla/tamu-event-app-ios/milestones) are first created to represent major features that need to be completed by a due date.  
* [Issues](https://github.com/rohitmucherla/tamu-event-app-ios/issues) should then be created and labeled with the associated milestone along with any other relevant labels. Issues should also be created for bugs (and labeled with bug) and may not be associated with a milestone  
* When commits are made, 1) describe what was done, 2) indicate the amount of time in hours it took to complete it, 3) reference issue numbers and close issues with commits. E.g. "Added Alamofire pod - 0.1 hours - referencing #590"
* When a feature branch is ready for master, make a pull request detailing the changes made, any dependency updates, and any other information to help with the merge.
* The project manager will be responsible for merging all pull requests, enforcing coding standards and generally keeping `master` stable and clean. In most cases the project manager will be responsible for upgrading dependencies as well.

## Code Style

* We follow the MVC development pattern (Model-View-Controller). Ensure at all times that logic for UIViews is in its corresponding class, with exceptions such as UIButtons where the logic will be in the UIButton extension under Extensions.swift
* Always add comments so that devs can easily follow the process flow for your code
* Organize relevant functions by adding marks, i.e. for outlets, add "// MARK: - Outlets" before all of the IBOutlets.
* Use guard statements and the nil coalescing operator, ??, as opposed to if let statements (when appropriate) to keep code looking concise. Examples can be found inside the project.
* Be conscientious of following the DRY (Don't Repeat Yourself) principle and refactor logic into functions as seen fit.
* Be aware of existing helper methods in the Utils directory to prevent invalidating DRY and to save yourself time.
* The following should be organized in your class from top to bottom: IBOutlets, IBActions, Life Cycle Methods, Relevant class methods (i.e. table view), Custom Methods


## QA Required Testing Before App Store Submission

1. Each test must be done online and offline when applicable, i.e. done offline and then go back online and pull down to sync.
2. Each test must be verified that it properly was synced to web when applicable.
