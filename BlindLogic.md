# Logic without Pictures

## Description

[Wikipedia](https://en.wikipedia.org/wiki/Aphantasia) describes *Aphantasia* as "a condition where one does not possess a functioning mind's eye and cannot voluntarily visualize imagery."  Although this may seem like a crippling condition to those who think visually, for most people with Aphantasia the condition does not inhibit learning, cognitive ability, or technical competence except in those cases where visualization is categorically necessary.  For example, an engineer with Aphantasia is typically no less capable than an engineer without Aphantasia.  However, individuals with Aphantasia seldom become artists, architects, or cartographers, as their limitations with visualization self-select these individuals out of those potential professions.   

The reason that Aphantasiac engineers are no less competent professionally is due to the adaptive capacity of the human brain.  Anecdotal evidence on the [Aphantasia subredit](https://www.reddit.com/r/Aphantasia) suggests that physiokinesthetic & spaciokinesthetic senses are coupled with Mathematical, Geometric, and Physics education to create the same capabilities as possessed by non-Aphantasiac engineers.

## Purpose

This document serves two purposes simultaneously:  

1. A reference for discussions with my supervisor who was appalled to discover that I could not visualize how a `Left Join` differed from an `Inner Join` in MySQL, in spite of the fact that I can use either operation as intended.  
2. A map of my internal representations regarding informal Set Theory, MySQL operations, and how I use these interrelated disciplines as a Back End software developer.  

## Logic *with* Pictures  

Picture a Venn Diagram.  Did it look like this?   
![Generic Venn Diagram](/Images/Venn0001.png "Easy, right?")

Now picture a Venn Diagram with `A` on the left, `B` on the right, with `C` showing the Intersection.  Did it look like this?  
![C = A ∩ B](/Images/venndiagram.bmp "C = A ∩ B")

I cannot picture either.  I can draw them, but I cannot imagine them.

## Logic *without* pictures

Look at any item in your immediate surroundings.  How do you know, just by looking, that none of those items is an SR-71 Blackbird?  
![SR-71 Blackbird](/Images/400px-SR-71.jpg "If you do see one of these, tell Professor X I said hello!")  
You don't need to picture a table to know that a car isn't a table.  You don't need to picture 4 apples and 2 oranges to get 6 fruit.  (If you do, tell your teacher I said hello and that you're excellent at language arts but your math skills need some training.)
Once you have sufficient definitions, you can logically group things together.  Likewise, you don't need to visualize cause and effect once have experienced a sufficient number examples.  Because I have dribbled a baskeball, a soccer ball, and a volleyball, I don't have to visualize a ball striking a surface before flying up and/or away to know that a ball "bounces".   
Another great example is welding.  When I was learning [arc welding](https://en.wikipedia.org/wiki/Arc_welding), I was repeatedly told to visualize the "bead" (the point at which the heat of the electrical arc is melting metal) as it "walked" the physical gap between the two pieces of steel being fused.  At that time, I hadn't even discovered the concept of Aphantasia, so I just kept my objections to myself and through a combination of mimicry and trial & error, I was able to learn to weld without ever visualizing the process.  I eventually developed a kinesthetic sense of how a particular motion would affect the weld, but it never involved picturing the bead.   
The kinesthetic sense in welding is particularly useful, as it involves [chirality](https://en.wikipedia.org/wiki/Chirality_(mathematics)) and [parity](https://en.wikipedia.org/wiki/Parity_(physics)).  
Briefly, chirality relates to "handedness" or rotation in non-3D-space.  For example, my welding gloves are mirror images, but no amount of spinning on the X, Y, or Z axes will allow me to put my left hand glove on my right hand.  However, if I turn the glove inside out, it will now fit my right hand.  Another example is a clock whose hands spin in their normal direction, but when looked at from behind the hands spin counter clockwise.  It is only by looking at a mirror's reflection that the back of the clock's hands will appear to be spinning in their typical direction.
Parity (simplified) refers to changes in state relative to a flip in the sign of one spacial coordinate.  So, for example, welding 1" steel plate, cut at a 45&#0176; bevel involves moving the tip of the welding rod rhythmically left and right over the join (`X = +1` becomes `X = 0` becomes `X = -1` becomes `X = 0` becomes `X= +1`), while simultaneously maintaining a specific distance above the bevel (`Z = 0` maintains `Z = 0` maintains `Z = 0`... ), before moving slightly forward with each rhythmic stroke (`Y = 1` becomes `Y = 0` becomes `Y = 1` becomes `Y = 0` becomes `Y = 1.1`).  This very convoluted description is a contrived, roughly accurate mathematical "picture" of what is happening in one single pass of a weld, including the beginning of the next.   
It is from these logical groupings, cause and effect observations, and distilled definitions of chirality and parity that nonvisual logical representations are derived.  

## Structured Queries, Set Notation, the Devil in the Details

For simplicity's sake, I will use the notation of [Set Theory](https://en.wikipedia.org/wiki/Set_theory) and [Formal Logic](https://en.wikipedia.org/wiki/List_of_logic_symbols) as little as possible to describe what is occurring internally.  Because of the limitations in abstraction, this isn't always possible.  However, it is because of the same limitations of abstraction that simile & metaphor may fail, leaving me to arcane symbolism as my only recourse.  
The following queries are based upon a fictitious, 3NF, perfectly-indexed,MySQL 5.6 database maintained by St. Peter at the Pearly Gates, with infinite storage space, Singlarity-Level optimization, containing the tables `people`, `angels`, `actions`, `thoughts`, `events`, `locations`, and as many others as is necessary to model all of history inside this atypical RDBMS.

### Simple Queries

#### FROM WHERE?

```sql
SELECT *
FROM people
WHERE homeostasis = TRUE;
```

When utilizing SQL, the best place to begin is **not** the beginning.  Instead, find the `FROM` section to determine which table forms the basis of the dataset.  From where?  People. Next, look at the `WHERE` to see what specific criteria are being selected for.  In this case, it means "those who are alive".  
Internally, the mental represesentation is identical to "Is this a book?  Or a TV?" It's simply definitional.

#### UNION, LIBERTY, CONFIDENCE

```sql
SELECT concat_ws(' ', firstName, lastName)
FROM people
WHERE sins > 0
UNION
SELECT concat_ws(' ', holyName, titularName)
FROM angels
WHERE sins > 0;
```

This is the set of all humans and angels who have sinned.  Its internal representation is identical to "all cats AND all dogs".

### Complicated Queries

#### There are no Atheists in Foxholes  

```sql
SELECT
    CONCAT_WS(' ', p.firstName, p.lastName)         AS 'Convert',
    old.name            AS 'Previous Beliefs',
    new.name            AS 'New Beliefs',
    c.eventDate         AS 'Conversion Date'
FROM people p
LEFT JOIN actions a ON a.performantID = p.id
JOIN conversions c ON c.personID = a.performantID
LEFT JOIN religion old ON c.oldDenomination = old.id
LEFT JOIN religion new ON c.newDenomination = new.id
WHERE a.eventDate > '1914-09-06'
    AND a.eventDate < '1918-11-11'
    AND a.type = 'Conversion'
    AND a.locationType = 'Battlefield'
    AND c.oldDenomination = 'Atheist'
```

Firts, let's examine the query. Start with the set of all people, then take the set of all actions committed by people and link them by person's identifier.  While that's being linked, we're also going to link all religious conversions to the Convert's personal ID, and we need information about the religions of the converts so we will link the `religions` table twice, aliasing them `old` to represent the 'from' and `new` to represent the 'to' in the conversion process.
From those sets and links, we only a particular subset of data to prove or disprove the idea that there are no atheists in foxholes.  World War 1 is infamous for trench warfare, so we filter the events with a date range between the first trench being dug (which we know to have been at the First Battle of the Marne on 9-6-1914) and the end of the war (11-11-1918).  Obviously, we only want `action`s that are of type `Conversion`, but we only want those that happened on the battlefield so we need to filter the `locationType` accordingly.  Lastly, a Catholic becoming a Protestant doesn't matter to an evaluation of atheists, so we need to filter the `Conversion`s to Atheists only.  
Once all of this is done, we will have a list of all converted Atheists by name, including their specific version of Atheism, and the religion they converted to.  
Internally, this query is very strange.  It begins with the set off all Christians and then strips away every Christian who did not convert in a trench during WWI before finally selecting the subset of those who were Atheists and not just unrepentant sinners.  All of the other details are just the necessary requirements of interacting with a database to get to that specific idea.  

### That point is pointless