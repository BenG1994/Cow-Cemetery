# Cow Cemetery

![120](https://user-images.githubusercontent.com/113778995/215942368-69ebeb09-729d-4053-b237-a28b8994d21f.png)

Cow Cemetery is a road trip game that takes a Midwestern staple and brings it to your pocket. Simply count the cows you see on your side of the road and add them up. But if you spot a cemetery, you lose half of your total. Download now from the [App Store](https://apps.apple.com/us/app/cow-cemetery/id1665221452).

## Introduction

Cow Cemetery has been a game my family has played on road trips for over 15 years, and it felt like a perfect type of game to bring to an app. You're already going to use your phone all the time on a 7+ hour drive, why not make it helpful? While the rules of the game are simple, implementing it into a functioning app took a little more planning than anticipated (i.e. math...). In order to visualize the game more, I opted to use emojis of cows and cemeteries to represent each player's totals.

## Skills used

* Swift 5
* Persisted all user data (player names, number of cows, number of cemeteries, and number of cemeteries) using User Defaults
* Used coputed properties for some math in adding cows

## Process and challenges

The most difficult part of creating Cow Cemetery for me was all the math that was involved. Having to take the input of what players add through the button and converting that into text to put into the total count was the first step. Then I needed to append each additional cow sighting to the total amount. After I accomplished that after some trial and error, the cemetery equation was simple in just dividing the current total by 2. 

Once the math was figured out, the rest of the app was (mostly) smooth sailing. In adding some visual representation to the app, I decided to have emojis represent the number of cows each player has. But to not completely cover the screen in cows, I thought it best to have a cow for every 10 that a players has. But a problem came from that. What if they have less than 10? It wouldn't make sense to see one cow for the first 20 and then every 10 after that. So I chose to have a second cow emoji for 1-9 and then switch to every 10 afterwards. It took some tweaking to get the emojis to display correctly between the two outcomes (0-9 and 10+), but once it got there, all that was left with the visuals was to add cemetery emojis for each time a player passed a cemetery. That function not only added a tombstone emoji underneath the cows (where an appended array of strings worked like a charm), but with the cows emoji function working properly, those decreased to display the correct number of cows.

I decided to save all the users data, such as player names, their cow count, and all the emojis using User Defaults because everything was strings, so it wouldn't be too taxing on the app to handle that. 

After that, all that was needed was to add a new game button which reset everything. Below is a screenshot from the app.

<img src="https://user-images.githubusercontent.com/113778995/215946489-76f6b732-b9ca-4e30-b177-ffd010aa91e1.PNG" width="200">

## Reflection

Cow Cemetery was a fun app for me to work on becauase it's a game that I've been playing for so long. It offered different challenges than my previous projects and allowed me to conquer simple math in the process. It was a completely different type of project and turned out simple and rather elegant into a game that can be played and enjoyed by anyone.

In the future, I plan to add a widget to see each players cow totals at a glance.
