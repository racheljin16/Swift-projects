## Carousel - Assignment 2

The purpose of this homework is to leverage views, view properties, and events to create a high fidelity prototype that is difficult to distinguish from a production app. We're going to use the techniques from this week to implement the Carousel app from the signed out state to the basic signed in state.

Time spent: **14** hours spent in total 

### Features

### Required User Stories
1. Landing Screen: 
  - Static photo tiles on the initial screen.
  - User can scroll to reveal sign in buttons.
2. Sign In
  - Tapping on email/password reveals the keyboard and shifts the scroll view and Sign In button up.
  - Upon tapping the Sign In button.
    - If the username or password fields are empty, user sees an error alert.
    - If credentials are incorrect, user sees a loading indicator for 2 seconds followed by an error alert.
    - If the credentials are correct, user sees a loading indicator for 2 seconds followed by a transition to the Sign In screens.
3. Tutorial Screens
  - User can page between the screens.
4. Image Timeline
  - Display a scrollable view of images.
  - User can tap on the conversations button to see the conversations screen (push).
  - User can tap on the profile image to see the settings view (modal from below).
5. Conversations
  - User can dismiss the conversations screen.
6. Settings
  - User can dismiss the settings screen.
  - User can log out.

### Optional User Stories:
1. Onboarding Tutorial
  - Add a page control.
  - Upon reaching the 4th page, the page indicators disappear and the "Take for a spin" button fades in.
  - Sign Out Tapping the "Sign Out" button presents an action sheet.
  
2. Landing Screen Animation
  - Photo tiles move, scale and rotate while user scrolls.

3. Sign in page
  - Sign In screen form scales and fades in as it appears.
  - Pulling down on the scroll view dismisses the keyboard.
  - Sign In screen form scales and fades in as it appears.

4. Create Account
  - Create the sign up flow.
  - Display the actual DropBox Terms using a web view.


##### Video Walkthrough 
- Here's a walkthrough of implemented user stories:

<a href="carousel-demo.gif" target="_blank"><img src='carousel-demo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' /></a>


##### Notes
- Spent some time on the tile animation. Still have some questions on code.
- Spent some time on popping twice method.



