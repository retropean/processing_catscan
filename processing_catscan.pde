// Left click: Advance Lyrics
// Right click: Go back on Lyrics
// Center click: Reset Lyrics
// Q: Next song
// W: Last song
// E: Toggle Line/Box Lyric Display
// +: Extra font
// _: Jackie Chan / Au Naturale font
// ): Default font
// z: Subtle vibrate
// x: More intense vibration

PFont f;  // Global font variable
int fs = 40; // Font size
int i = 0; // Lyric index
int si = 0; // Song index
int e = 0; // Lyric display toggle index
int z = 0; // Intense vibration toggle index
int c = 0; // Brutally Intense vibration toggle index
int x = 0; // Text X location
int y = 0; // Text Y location
int bubbletoggle = 0;
int num = 150;
int[] bubblex = new int[num];
int[] bubbley = new int[num];

void setup() {
  fullScreen(2);
  //size(400,200);
  frameRate(20);
  f = createFont("Lato-Regular.ttf", fs);
  
  //View available fonts
  //String[] fontList = PFont.list();
  //printArray(fontList);
}

void draw() {
  background(0);
  x = width/2;
  y = height/2; 
  ////////////////////BUBBLE\\\\\\\\\\\\\\\\\\\\
  if (bubbletoggle == 1) { 
    for (int i = num-1; i > 0; i--) {
    bubblex[i] = bubblex[i-1];
    bubbley[i] = bubbley[i-1];
    }
    // Add the new values to the beginning of the array
    bubblex[0] = mouseX;
    bubbley[0] = mouseY;
    // Draw the circles
    for (int i = 0; i < num; i++) {
      fill(255-i,255-i,255-i);
      ellipse(bubblex[i], bubbley[i], i/2.0, i/2.0);
    }
  }
  ////////////////////GENTLE VIBRATION\\\\\\\\\\\\\\\\\\\\
  if (z == 1) {
    x += random(-2, 2);
    y += random(-2, 2);
  }
  ////////////////////INTENSE VIBRATION\\\\\\\\\\\\\\\\\\\\
  if (c == 1) {
    x += random(-8, 8);
    y += random(-8, 8);
  }
  ////////////////////LINE DISPLAY\\\\\\\\\\\\\\\\\\\\
  if (e == 0) {
    if (width <= 400) {
      fs = 20;
    }
    textFont(f,fs);   
    fill(255);
    textAlign(CENTER);
    text(lyricssorted[si][i],x,y);
  }
  ////////////////////BOX DISPLAY\\\\\\\\\\\\\\\\\\\\
  else if (e == 1) {
    textLeading(0);
    textFont(f); 
    fill(255);
    textAlign(LEFT);
    text(lyricssorted[si][i],x-200, y-200, 300, 800);
  };
}
  
void mouseReleased() {
  ////////////////////LYRIC CONTROL\\\\\\\\\\\\\\\\\\\\
  if (mouseButton == LEFT){
    if (i == lyricssorted[si].length-1){
      i = i;
    }
    else i=i+1;
  }
  else if (mouseButton == RIGHT){
    if (i == 0){
      i = 0;
    }
    else i=i-1;
  }
  else if (mouseButton == CENTER){
    i = 0;
    println("Resetting lyric");
  }
}

void keyReleased() { 
  ////////////////////SONG CONTROL\\\\\\\\\\\\\\\\\\\\
  if (key == 'Q') {
    if (si == lyricssorted.length-1){
        si = si;
      } 
    else si=si+1;
    println("Advancing track");
   }
   if (key == 'W') {
    if (si == 0){
        si = 0;
      } 
    else si=si-1;
    println("Going back a song");
   }
   //TOGGLE BOX-LINE VIEW MODE
   if (key == 'E') {
    if (e == 0){
        e = 1;
        println("Switching to box view mode");
      } 
    else {
      e=0;
      println("Switching to line view mode");
    };
   }
   //FONT CONTROL
   if (key == '+') {
    f = createFont("SourceCodePro-Regular.ttf", fs);
    println("Switch font to extra font space");
   }
   if (key == '_') {
    f = createFont("Monospaced.plain", fs);
    println("Switch font for Jackie Chan");
   }
   if (key == ')') {
    f = createFont("Lato-Regular.ttf", fs);
    println("Switch font to default font");
   }
   //KILL INTENSE VIBRATION
   if (key == 'z') {
     if (z == 1){
         z = 0;
     }
   }
   //KILL THE EVEN MORE INTENSE VIBRATION
   if (key == 'x') {
     if (c == 1){
         c = 0;
     }
   }
   //KILL BUBBLES
   if (key == 'c') {
     if (bubbletoggle == 1){
         bubbletoggle = 0;
         for (int i = num-1; i > 0; i--) {
            bubblex[i] = -40;
            bubbley[i] = -40;
          }
     }
   }
}
void keyPressed() {
  //INTENSE VIBRATION
  if (key == 'z') {
    if (z == 0){
        z = 1;
    }
  }
  //EVEN MORE INTENSE VIBRATION
  if (key == 'x') {
    if (c == 0){
        c = 1;
    }
  }
  //BUBBLE TOGGLE
  if (key == 'c') {
    if (bubbletoggle == 0){
        bubbletoggle = 1;
    }
  }
}

String[][] lyrics = {
  {
    //This Adventure is Happening
    "",
    "I took the day off and we're sticking to the plan",
    "I can't come to the phone right now",
    "I left a sticky with instructions on the fridge",
    "I gotta swing by the house and grab my amulet",
    "",
    "You've got obligations",
    "(THIS ADVENTURE'S HAPPENING)",
    "What's your explanation?",
    "(THIS ADVENTURE'S HAPPENING)",
    "I'm starting to lose my patience.",
    "(THIS ADVENTURE'S HAPPENING)",
    "",
    "The idol burns with an ominous light",
    "Tuck it in your cloak, friend, keep it out of sight",
    "The wizard will appraise it and trade it for a map",
    "Written in a language only spoken in the past",
    "",
    "Can you fathom the fathoms deep in the caverns",
    "Do you insist this abyss is amiss ",
    "Do you gape at the gaping great grotto",
    "Or itch to pitch right into the ditch",
    "",
    "You've got obligations",
    "(THIS ADVENTURE'S HAPPENING)",
    "What's your explanation?",
    "(THIS ADVENTURE'S HAPPENING)",
    "I'm starting to lose my patience.",
    "(THIS ADVENTURE'S HAPPENING)",
    "",
    "Steel meets skull with a sickening crack",
    "The Mangeler's bones turn back into stones",
    "The water recedes and path is revealed",
    "The Serpent Lord's treasure horde is your’s",
    "",
    "You've got obligations",
    "(THIS ADVENTURE'S HAPPENING)",
    "What's your explanation?",
    "(THIS ADVENTURE'S HAPPENING)",
    "I'm starting to lose my patience.",
    "(THIS ADVENTURE'S HAPPENING)",
    "",
    "You open your door to that old familiar smell",
    "Your apartment looks pretty much as you left it",
    "452 work related emails",
    "Here's my phone charger, where's my amulet?",
    "",
  },
  {
    //Cog
    "",
    "Here I am",
    "Just a cog, all by myself",
    "Here I am",
    "And here I go",
    "Watch me now",
    "Watch me now",
    "I hope you like me",
    "",
    "They call me cog",
    "I just fit in",
    "Like a cog",
    "It’s my only job",
    "",
    "With my friends",
    "Just a cog with all my friends",
    "With my friends",
    "Party on",
    "Look like me",
    "Act like me",
    "I hope they like me",
    "",
    "Generation cog",
    "People like me",
    "Let me call you cog",
    "It's my only job",
    "",
    "I need you",
    "I can't think, I'm just a cog",
    "Without you",
    "I can't function",
    "",
  },
  {
    //KK Rider
    "",
    "K.K. Rider, he's a fighter",
    "With his gleaming sword in his hands",
    "Killing evil giant weevils",
    "K.K. Rider's the man",
    "",
    "Riding through the day and riding through the night",
    "And if you are a villain then you'd best prepare to fight",
    "Go, you K.K. Rider",
    "Until the day you die",
    "",
    "From high mountains, K.K. Rider",
    "His rumour like wind through the grass",
    "Evil kings start hearing things",
    "Of a Rider ever so fast",
    "",
    "Sending out their soldiers, villages will burn",
    "But alas the ambush army never will return",
    "Due to the K.K. Rider,",
    "So Go K.K. Rider, go!",
    "",
    "And K.K. knows",
    "When his sword glows",
    "Here come the foes",
    "",
    "Beholder slayer, K.K. Rider",
    "He'll take on two dragons at once",
    "Finding treasure at his leisure",
    "'Cuz swiftly and softly he hunts",
    "",
    "Now he's just a legend, a story  of the past",
    "But wait is that the sound of a horseman riding fast?",
    "Anon! Here comes the Rider",
    "Buckle under his swift blow",
    "You just can't beat the Rider",
    "Go, K.K. Rider, Go!",
    "",
  },
  {
    //Government Name
    "",
    "I’m going to call you by your government name",
    "",
    "I’m going to call you by your government name",
    "Call You By Your government name",
    "Don't even try to beef with me",
    "Stay anonymous like all my enemies",
    "It’s just one of those things",
    "where you think it’s ok",
    "To start a beef with me",
    "but that’s a big mistake",
    "And at the end of the day,",
    "I’m very sorry for you",
    "You are an old old man",
    "who's lost the spotlight, dude",
    "You lost your relevance",
    "and now you’re tryin' to reclaim",
    "The spotlight from my spotlight",
    "but you're tired and lame",
    "So that’s not gonna work",
    "Ghost Dennis",
    "You are gonna be done",
    "Ghost Dennis",
    "",
    "I’m going to call you by your government name",
    "Call you by your government name",
    "Don't even try to beef with me",
    "Stay anonymous like my enemies",
    "In fact if you ever say anything",
    "I will erase you from the album",
    "I will erase you from the record books",
    "And I'll erase you from the album",
    " You are gonna be done,",
    "You are my son,",
    "which means you’ve got to listen to me   ",
    "I'm your father, I said,",
    "and I butter your bread,",
    "Now do you understand me?",
    "I’m sorry, I'm not gonna to let this slide",
    "And though I pity you",
    "some punishment is what is required",
    "I am expecting a written apology",
    "Some contrition,",
    "of your sorrows and your sadness, you see",
    "I’m going to call you by your government name",
    "Call you by your government  name",
    "Life is no nintendo game",
    "Don't you ever mention my name again",
    "In fact if you ever say any thing",
    "I will erase you from the album",
    "I will erase you",
    "from the record books",
    "And I'll erase you from this album",
    "",
  },
  {
    //Voodoo Dollhouse
    "",
    "She put me in a voodoo dollhouse",
    "And she tied me to a tiny plastic chair",
    "Which she keeps inside her voodoo dollhouse",
    "With my photo and a locket of my hair",
    "And I think that it might be a curse",
    "Cause she’s stolen my heart and she put it in her purse",
    "And I don't think that I am ever coming home",
    "Lights out, candles burning",
    "My mind is racing, tummy turning",
    "Sitting on needles and on pins",
    "I hold my breath as she walks in",
    "I never really wanted",
    "To be an independent person",
    "Or in my dreams imagined",
    "I’d be involved in such perversion",
    "Forcefed twisted tainted love",
    "Dripping down in a mist from above",
    "Darkness surrounds me",
    "Her arms are wrapped around me",
    "She egged me on",
    "She made an omelette",
    "She made my soul sick",
    "Spiritual vomit",
    "She put me in a voodoo dollhouse",
    "And she tied me to a tiny plastic chair",
    "Which she keeps inside her voodoo dollhouse",
    "With my photo and a locket of my hair",
    "And she tells me that I might be the one",
    "But I’m not about to argue when she's pointing the gun",
    "And I don't think that I am ever coming home",
    "",
    "aaah!!",
    "girls abrɛ",
    "makɔ alhaji hɔ",
    "makɔ gye aduro for boys",
    "medi aduro ɛgu n'dweane mu",
    "ama n'dmɔ me",
    "ate ta, ate ta, ate ta",
    "",
    "She put me in a voodoo dollhouse",
    "And she tied me to a tiny plastic chair",
    "Which she keeps inside her voodoo dollhouse",
    "With my photo and a locket of my hair",
    "She melted my mind just like a svengali",
    "She molded me into her own voodoo dolly",
    "And I don't think that I am ever coming home",
    "And I’m burning it down, down, down",
    "Down, down, down, down",
    "Down, down, down",
    "Down, down, down, down, down, down, down, down, down",
    "",
  },
  {
    //Skeleton Crew
    "",
    "There's no more room in our skeleton crew! ",
    "",
    "Avast ye, barkeep, tis our last night ashore",
    "Will our last piece of gold afford us one more? ",
    "A flagon of ale before we set sail ",
    "And a bottle of rum for me and me chum",
    "Shiver me timbers and rattle me bones ",
    "Untangle the cables and plug in the 'phones ",
    "Go string up the axes and tune them up tight ",
    "It sounds like we'll be first to go out tonight ",
    "",
    "There's no more room in our skeleton crew ",
    "It's just us few, it's just us few",
    "There's no more room in our skeleton crew ",
    "It's just us few, it's just us two",
    "There's no more room in our skeleton crew ",
    "",
    "We shout through the tempest without sound or sight ",
    "Though deafened by silence and blinded by light ",
    "We'll weather the storm without losing face ",
    "and vow that we'll never return to this place ",
    "",
    "There's no more room in our skeleton crew ",
    "It's just us few, it's just us few",
    "There's no more room in our skeleton crew ",
    "It's just us few, it's just us two",
    "There's no more room in our skeleton crew ",
    "",
    "We stay at our posts though the sun she doth roast ",
    "Though the wind she doth bite, we'll do what is right ",
    "Until ravenous gulls pluck the eyes from our skulls ",
    "We dance with delight though there's no end in sight",
    "We do what we can, we love what we do ",
    "We do what we must to steer our ship true ",
    "Though our bones turn to dust, our cannons may rust ",
    "Oh, the legends they'll tell of our skeleton crew ",
    "",
    "There's no more room in our skeleton crew ",
    "It's just us few, it's just us few",
    "There's no more room in our skeleton crew ",
    "It's just us few, it's just us two",
    "There's no more room in our skeleton crew ",
    "",
    "There's no more room in our skeleton crew ",
    "It's just us few",
    "It's just us two",
    "",
  },
  {
    //Every Word Rewritten
    "",
    "You can paint this bathroom stall",
    "Mask the writing on this wall ",
    "Hide the slanders once here etched ",
    "Cover up the dicks we've sketched ",
    "",
    "Take away our dirty jokes ",
    "Veil our log of chicken-chokes ",
    "Shroud our tales of getting laid ",
    "Clean the bogies, eunich-made ",
    "",
    "But no matter how you strain ",
    "All your efforts end in vain",
    "Every word will be rewritten ",
    "Long as man still sits here shittin'",
    "Every word will be rewritten ",
    "Every word will be rewritten",
    "",
    "Every word will be rewritten ",
    "Long as man still sits here shittin' ",
    "Every word will be rewritten",
    "Every word will be rewritten",
    "",
  },
  {
    //Stick Up
    "",
    "Alright",
    "Everybody listen up",
    "THIS IS A STICK UP",
    "This isn’t a joke",
    "It’s not a fucking song",
    "THIS IS A STICK UP",
    "Give us all your cash, your watches and jewelry",
    "You: get your hands up!",
    "Reach for the sky",
    "And keep them held high",
    "Hands where we can see them, people",
    "No one has to die",
    "",
    "This is not a concert",
    "We are not a band",
    "We’ve been planning this for decades",
    "and now we show our hand",
    "We never got a drummer, it’s a 50/50 split",
    "The music’s pre-recorded, we’re not playing shit",
    "You should’ve joined our mailing list",
    "You should’ve bought a shirt",
    "But you fucked up, give us your stuff",
    "and no one will get hurt",
    "In the music business, this is how it goes",
    "if you want to make a decent profit at your shows",
    "",
    "Alright",
    "Everybody shut up",
    "THIS IS A STICK UP",
    "Where’s my money?",
    "You think I’m being funny?",
    "THIS IS A STICK UP",
    "Don’t call the fucking cops",
    "Don’t try to be a hero",
    "You: stop crying!",
    "I’ll bash you in the face",
    "With my motherfucking bass",
    "If any of you sons of bitches",
    "Try to leave this place",
    "",
    "This is not a concert",
    "We are not a band",
    "We’ve been planning this for decades",
    "and now we show our hand",
    "We never got a drummer, it’s a 50/50 split",
    "The music’s pre-recorded, we’re not playing shit",
    "You should’ve joined our mailing list",
    "You should’ve bought a shirt",
    "But you fucked up, give us your stuff",
    "and no one will get hurt",
    "In the music business, this is how it goes",
    "if you want to make a decent profit at your shows",
    "",
    "This is not a concert",
    "We are not a band",
    "We’ve been planning this for decades",
    "and now we show our hand",
    "We never got a drummer, it’s a 50/50 split",
    "The music’s pre-recorded, we’re not playing shit",
    "You should’ve joined our mailing list",
    "You should’ve bought a shirt",
    "But you fucked up, give us your stuff",
    "and no one will get hurt",
    "In the music business, this is how it goes",
    "if you want to make a decent profit at your shows",
    "",
  },
  {
    //Tough Guy in New York
    "",
    "So you think you’re the only tough guy from New York City?",
    "But you don’t know my crew",
    "and, brother, you don't know me",
    "",
    "We saw your boy",
    "getting pinched last night",
    "Ten kilos of coke,",
    "you know that china white",
    "",
    "Now you’re crying to the jake right away?",
    "Yeah, that ain't right",
    "",
    "Why are goons not as hard as mine?",
    "Stop this pretending and acting,",
    "and stop your lying",
    "",
    "Be real,",
    "like your video said",
    "and don’t you even mention my name again",
    "",
    "So you think you're the only tough guy in New York City",
    "But you don't know my crew",
    "and, brother, you don't know me",
    "",
  },
  {
    //Coronation of the Damned
    "",
    "Please accept this formal invitation",
    "Join us for a regal celebration",
    "Take a seat among the congregation",
    "Witness the majestic coronation of the damned",
    "",
    "See the queen’s contemptible contortions",
    "It’s time for her perennial abortion",
    "Carry on the screaming and the torture",
    "So say we, her majesty’s consortium and a portion of the damned",
    "We are the damned",
    "",
    "Every bastard come along",
    "Point your fingers, ring the gong  ",
    "Doesn’t matter if we’re wrong",
    "Never stop singing this song",
    "",
    "Finally unleash a culminated",
    "Century of unrelenting hatred",
    "Aim it at the traitors and the jaded",
    "So say we, the sated and the nevermore berated of the damned",
    "",
    "We are the damned",
    "",
  },
  {
    //Free Brick
    "",
    "Free brick, flying through my window",
    "Spray paint, decorates my house",
    "And you left a note for me,",
    "that you scratched there with a key",
    "on the door of my new 240z",
    "",
    "Pink slip, neverending weekend",
    "Road trip, living in my car",
    "This new diet program's great",
    "I've lost a ton of weight",
    "it's been a couple weeks since last I ate",
    "",
    "When you think about it",
    "everything doesn't have to be so sad",
    "Despite a broken window,",
    "shattered glass",
    "just remember you still have a",
    "free brick",
    "",
    "Free pipe, full of free explosives",
    "Free powder, poofing out my mail",
    "I'll enjoy a sudden nap",
    "provided by your baseball bat",
    "while you kindly tie me up in a sack",
    "",
    "Drafted, travel round the world now.",
    "Free shrapnel lodged into my spleen",
    "It's nice you gave to me",
    "so intravenously",
    "a case of someone else's HIV",
    "",
    "When you think about it",
    "everything doesn't have to be so sad",
    "despite a broken window,",
    "shattered glass",
    "just remember you still have a",
    "free brick",
    "",
  },
  {
    //Reagan's Ghost
    "",
    "I was talking to Reagan's ghost",
    "He said some things I hadn't thought of",
    "In a long, long time",
    "",
    "I thought of the things that Reagan brought up",
    "Trying to think of how he could've found out",
    "I thought of the things that Reagan brought up",
    "Trying to think of how he could've found out",
    "",
    "Would you mind if I took a little bite of your soul?",
    "Or could I wrap this paradigm to go?",
    "It'd make a nice breakfast",
    "Cold and lifeless",
    "",
    "You know why you're here now, don't you?",
    "Yes.",
    "",
    "I thought of the things that Reagan brought up",
    "Trying to think of how he could've found out",
    "I wiped out the things dead Ronnie brought up",
    "He stared at the stars until I caught up",
    "",
  },
  {
    //Wet Country
    "",
    "Up before dawn, before the sun",
    "I drop my line in and wait",
    "Bass, take a look at blood worms on hook",
    "Those bastards will fall for the bait",
    "Been out on the bay for dang near all day",
    "Haven’t had me one single bite",
    "Earning vacation pay and I’m here to stay",
    "Don’t care if it takes me all night",
    "Thank god I’m livin’ in a wet county",
    "Wishin’ that a fish’ll come to me worth mounting",
    "On my kitchen wall",
    "Next to that picture of Pa",
    "Got my fishin' line in hand and my gal in the other",
    "Finished my beer baby grab me another",
    "Make it a cool one",
    "Check if the mountains are blue, hon",
    "Fill the bed of my truck with gravel and stones",
    "Diesel in my blood and steel in my bones",
    "I thank god for this wet county",
    "All hands on deck, come over and check",
    "This fighter I’ve got on my line",
    "Run over and get my granddaddy's net",
    "This bastard soon will be mine",
    "I finally win",
    "I reel ‘er in",
    "But it ain’t fish, it’s a log",
    "I guess I was tricked, it’s just an old stick",
    "At least we’ll play fetch with my dog",
    "Thank god I’m livin' in a wet county",
    "Wishing that a fish will come to me worth mounting",
    "On my kitchen wall",
    "Next to that picture of Ma",
    "Got my fishin' line in hand and my gal in the other",
    "Finished my beer baby grab me another",
    "Make it a cool one",
    "Check if the mountains are blue, hon",
    "Fill the bed of my truck with gravel and stones",
    "Diesel in my blood and steel in my bones",
    "I thank god for this wet county",
    "Cut them at the gill and fire up the grill",
    "I hope eat your fill, kick back and chill",
    "Baby, please don’t go, sure, we can take it slow",
    "But if this is the end then I’m glad you brought your friends",
    "Thank god I’m livin' in a wet county",
    "Wishing that a fish will come to me worth mounting",
    "On my kitchen wall",
    "Next to that picture of Paul",
    "Got my fishin' line in hand and my gal in the other",
    "Finished my beer baby grab me another",
    "Make it a cool one",
    "Check if the mountains are blue, hon",
    "Fill the bed of my truck with gravel and stones",
    "Diesel in my blood and steel in my bones",
    "I thank god for this wet county",
    "",
  },
  {
    //Marine Biologist
    "",
    "Three thousand meters below the surface is my home",
    "The common jellyfish, and several macro-organisms",
    "We have a saying here, where light becomes a memory:",
    "Your eyes adjust quite nicely after a couple of years.",
    "Of course you know the ocean scene, squids a-floating by",
    "Hidden beaks and tentacle feets and little tiny jelly eyes",
    "They have a purpose, you know, a reason to stay alive",
    "They're the food of viperfish",
    "Chauliodus macouni",
    "Dive",
    "Dive with me",
    "Check out this submersibility",
    "Breathe",
    "Breathe with me",
    "From a tank",
    "While we sink",
    "Into the sea",
    "YO, HO!",
    "YO, HO!",
    "",
    "Deeper I sink, and pitcher it's black,",
    "the outer lights are activated",
    "Illuminating a world which has never been illuminated",
    "A sweeping forest of giant tube worms fills my eyes",
    "And there dart about one thousand Chambered Nautili",
    "With a swish, a Grenadier Fish bites a little glowy thing",
    "It's violently slain by an angler,",
    "Melanocetus johnsoni",
    "Here's an interesting specimen,",
    "Vampyroteuthis infernalis",
    "That means the",
    "Vampire Squid from Hell",
    "Dive",
    "Dive with me",
    "Check out this submersibility",
    "Breathe",
    "Breathe with me",
    "From a tank",
    "While we sink",
    "Into the sea",
    "YO, HO!",
    "YO, HO!",
    "",
    "Dive",
    "Dive with me",
    "Check out this submersibility",
    "Breathe",
    "Breathe with me",
    "From a tank",
    "While we sink",
    "Into the sea",
    "",
  },
  {
    //They'll Need a Crane
    "",
    "Love sees love's happiness",
    "But happiness can't see that love is sad ",
    "That love is sad ",
    "Sadness is hanging there",
    "To show love somewhere something needs a change",
    "They need a change ",
    "They'll need a crane",
    "To take the house he built for her apart",
    "To make it break",
    "It's gonna take",
    "A metal ball hung from a chain",
    "They'll need a crane",
    "They'll need a crane",
    "To pick the broken ruins up again",
    "To mend her heart",
    "To help him start",
    "To see a world apart from pain ",
    "",
    "Lad's gal is all he has",
    "Gal's gladness hangs upon the love of lad",
    "The love of lad ",
    "Some things gal says to lad",
    "Aren't meant as bad but cause a little pain",
    "They cause him pain",
    "They'll need a crane",
    "To take the house he built for her apart",
    "To make it break",
    "It's gonna take",
    "A metal ball hung from a chain",
    "They'll need a crane",
    "They'll need a crane",
    "To pick the broken ruins up again",
    "To mend her heart",
    "To help him start",
    "To see a world apart from pain ",
    "",
    "Don't call me at work again",
    "No, no, the boss still hates me",
    "I'm just tired",
    "and I don't love you anymore",
    "And there's a restaurant we should check out ",
    "Where the other nightmare people like to go",
    "I mean nice people",
    "Baby wait,",
    "I didn't mean to say nightmare",
    "",
    "Lad looks at other gals",
    "Gal thinks Jim Beam is handsomer than lad",
    "He isn't bad ",
    "Call off the wedding band",
    "Nobody wants to hear that one again",
    "Play that again ",
    "They'll need a crane",
    "To take the house he built for her apart",
    "To make it break",
    "It's gonna take",
    "A metal ball hung from a chain",
    "They'll need a crane",
    "They'll need a crane",
    "To pick the broken ruins up again",
    "To mend her heart",
    "To help him start",
    "To see a world apart from pain ",
    "They’ll need a crane",
    "",
  },
  {
    //Meathook Fanclub
    "",
    "Slurring every word",
    "Acting like an animal",
    "Memory erase",
    "Wake up in the bathroom",
    "",
    "He's the kraken released,",
    "The missing piece",
    "Betwixt human and beast",
    "Open the lid",
    "Ego overtaken,",
    "Conquered by the id",
    "He’s Jekyll and Hyde",
    "A cancerous growth",
    "Corrupted from the inside",
    "His work is never done",
    "He's the sole member of a fanclub of one",
    "",
    "I can feel my head",
    "Filling up with concrete",
    "Horseboy says,",
    "“Pass along the Mad Dog”",
    "",
    "He's the kraken released,",
    "The missing piece",
    "Betwixt human and beast",
    "Open the lid",
    "Ego overtaken,",
    "Conquered by the id",
    "He’s Jekyll and Hyde",
    "A cancerous growth",
    "Corrupted from the inside",
    "His work is never done",
    "He's the sole member of a fanclub of one",
    "",
    "Standing in the dark",
    "Shouting at a cell phone",
    "Karate kick a car",
    "Wake up in the parking lot",
    "",
    "He's the kraken released,",
    "The missing piece",
    "Betwixt human and beast",
    "Open the lid",
    "Ego overtaken,",
    "Conquered by the id",
    "He’s Jekyll and Hyde",
    "A cancerous growth",
    "Corrupted from the inside",
    "His work is never done",
    "He's the sole member of a fanclub of one",
    "",
  },
  {
    //Non Sequitur
    "",
    "Six thousand years ago",
    "the world was nothing like the one we know.",
    "There were no planes or trains or even cars",
    "we rode the backs of dinosaurs.",
    "Way back,",
    "when Earth was young",
    "we lived among",
    "those noble beasts",
    "we lived in peace with dinosaurs.",
    "Behemoth and Leviathan",
    "and the Dragons,",
    "they roamed the fields",
    "for real",
    "and it was very good.",
    "Found them",
    "and gave them names",
    "and made them tame,",
    "it was a paradise of man and dinosaur!",
    "Lord, give me a home",
    "where the brontosaurus roam.",
    "Lord, please close my mind",
    "to science, the bane of mankind.",
    "Way back,",
    "when Earth was young",
    "we lived among",
    "those noble beasts",
    "we lived in peace with dinosaurs.",
    "Behemoth and Leviathan",
    "and the Dragons,",
    "they roamed the fields",
    "for real",
    "and it was very good.",
    "Found them",
    "and gave them names",
    "and made them tame,",
    "it was a paradise of man and dinosaur!",
    "",
  },
  {
    //Finger of Justice
    "",
    "The Finger of Justice rises up",
    "to grasp the loaded steel ",
    "The bullet that pierces evil men",
    "and forces them to yield ",
    "Finger,",
    "Ride!",
    "Finger, ",
    "Ride!",
    "",
    "I robbed a bank the other day",
    "and killed a banker in my way ",
    "No one knew that it was me",
    "because I wore a mask, you see ",
    "The sheriff looks me in the eyes",
    "and asks me twice and I deny it ",
    "No one knows what I have done ",
    "way out west, ",
    "beneath the burning sun ",
    "",
    "But at night ",
    "The voices in my head ",
    "Whisper in my ear, I fear",
    "The voices in my head ",
    "",
    "The Finger of Justice rises up",
    "into my room again ",
    "Forever it haunts the dreams",
    "of every mortal man of sin ",
    "Finger,",
    "Ride!",
    "Finger, ",
    "Ride!",
    "Finger,",
    "Ride!",
    "Finger, ",
    "Ride!",
    "",
  },
  {
    //The Decider
    "",
    "I'm the decider",
    "I decide what is best",
    "I make big decisions",
    "Then I take a rest",
    "I'm the decider",
    "And I guess I'll do my best",
    "I wake up and go downstairs and sit down at my desk",
    "Pour myself a bowl of Lucky Charms and call my friends",
    "They can help me figure out exactly what to do",
    "Who to talk to, what to say, and how to tie my shoe",
    "I'm the decider",
    "And I decide what is best",
    "I make big decisions",
    "Then I take a rest",
    "I'm the decider",
    "And I guess I'll do my best",
    "How is it always my fault whenever shit goes wrong",
    "Pray to Jesus, give me strength, to finish up my song",
    "I cannot completely know or fully understand",
    "What exactly God is thinking as he guides my hand",
    "I'm the decider",
    "And I decide what is best",
    "I make big decisions",
    "Then I take a rest",
    "I'm the decider",
    "And I guess I'll do my best",
    "",
  },
  {
    //The Autophobe
    "",
    "I'm not a mind reader",
    "A human party favor",
    "Go check the parking meter",
    "or move your car",
    "For your consideration",
    "You deal with your frustration",
    "By seeking approbation",
    "I think they towed your car",
    "I fear an angry bee",
    "Someone else made mad at me",
    "I fear an angry bee",
    "Someone else made mad at me",
    "He walks away from harm",
    "and the impending swarm",
    "",
    "Capsized the raft again",
    "Scuttled your craft again",
    "Your polystyrene friends",
    "will take you home",
    "Goodbye, good luck, good night",
    "You're gonna miss your flight",
    "You'd do that out of spite",
    "Like when you lost your car",
    "I fear an angry sea",
    "That the Gods brought down on me",
    "I fear an angry sea",
    "Crushing waves are drowning me",
    "I see a monstrous form in the impending storm",
    "",
  },
  {
    //Polished to Perfection
    "",
    "Best in quality",
    "That's the Mervis guarantee",
    "Born in South Africa",
    "Diamond mining's in our blood",
    "Polished to perfection",
    "Straight from our collection",
    "Make the right selection every time",
    "",
    "From factory to finger",
    "From finger to her heart",
    "Show her that you'll never be apart",
    "Excavation underground",
    "Ken is mining two miles down",
    "Brother Zed is on the phone:",
    "Twenty tons of rock for every stone",
    "",
  },
  {
    //Jackie Chan
    "",
    "今天我找不到的话",
    "有东西，我不得不说",
    "直到我找到另一种方式",
    "还有，我得留下来",
    "",
    "谢谢",
    "",
  },
  {
    //Au Naturale
    //ASCII from http://1lineart.kulaone.com/#/
    "",
    "¸¸·¯·¸¸♪·¯·¸¸Au Naturale¸¸·¯·¸¸♪·¯·¸¸",
    "",
    "(¯`·._.··¸.-~*´¨¯¨`*·~-.,Au Naturale,.-~*´¨¯¨`*·~-.¸··._.·´¯)",
    "><(((('>",
    "I worked at Whole Foods",
    "Chopping heads off of fishes",
    "Somehow I knew",
    "This is not the job for me",
    "Freed my pets",
    "Gave up meat",
    "Then tried eating bugs",
    "Made them sad",
    "And I felt bad",
    "So I gave that up ",
    "Quit my job",
    "Sold my car",
    "Burned down my house",
    "Along with all my clothes",
    "Made my mailbox into a birdhouse",
    "For a family of crows",
    "(¯`·._.·(¯`·._.· Au Naturale ·._.·´¯)·._.·´¯)",
    "",
    ",.-~*´¨¯¨`*·~-.¸ Au Naturale ,.-~*´¨¯¨`*·~-.¸",
    "¸.·´¯`·.´¯`·.¸¸.·´¯`·.¸><(((º>",
    "I made a new home",
    "On the peak of a mountain",
    "I hurled my cellphone",
    "Off the top of said mountain",
    "I don't shave in my cave",
    "Grew out my hair",
    "My roommate's a bear",
    "RENT WAS DUE A WEEK AGO",
    "Hope he doesn’t maul me",
    "I do yoga",
    "Every morning at sunrise",
    "Breakfast is fungus and a cold glass of milkweed",
    "d(^o^)b¸¸♪♪·¯·¸¸♪·¯·¸¸♪♪",
    "--------{---(@",
    "(,(,(,(,(,(,(,(, '')",
    "",
  },
  {
    //Cowtown
    "",
    "I'm going down to Cowtown",
    "The cow's a friend to me",
    "Lives beneath the ocean",
    "And that's where I will be",
    "Beneath the waves, the waves",
    "And that's where I will be",
    "I'm gonna see the cow beneath the sea",
    "",
    "The yellow Roosevelt Avenue leaf overturned ",
    "The ardor of arboreality Is an adventure",
    "We have spurned, we've spurned",
    "A new leaf overturned",
    "It's a new leaf overturned ",
    "",
    "And so I'm going down to Cowtown",
    "The cow's a friend to me",
    "Lives beneath the ocean",
    "And that's where I will be",
    "Beneath the waves, the waves",
    "And that's where I will be",
    "I'm gonna see the cow beneath the sea",
    "",
    "We yearn to swim for home",
    "But our only home is bone",
    "How sleepless is the egg",
    "Knowing that which throws the stone",
    "Foresees the bone, the bone",
    "Our only home is bone",
    "Our only home is bone ",
    "",
    "And so I'm going down to Cowtown",
    "The cow's a friend to me",
    "Lives beneath the ocean",
    "And that's where I will be",
    "Beneath the waves, the waves",
    "And that's where I will be",
    "I'm gonna see the cow beneath the sea ",
    "'m going down to Cowtown",
    "The cow's a friend to me",
    "Lives beneath the ocean",
    "And that's where I will be",
    "Beneath the waves, the waves",
    "And that's where I will be",
    "I'm gonna see the cow beneath the sea ",
    "Yes I'm gonna see",
    "the cow",
    "beneath the sea",
    "",
  },
  {
    //Portly Chap
    "",
    "Up close doesn't think",
    "Dennistown any thing",
    "I got a thing as lemonlike ",
    "as Eagleflight with broken pipes",
    "You think you&apos;re going unaffected",
    "Dealing irresponsibly ",
    "Lost and lonely Lady ",
    "And her bowl of gimpy vines and me",
    "Handy Dandy",
    "Willy Nilly",
    "Handy Dandy",
    "Willy Nilly",
    "I think this willy nilly ",
    "Hussein DVD",
    "Will take the ring to Woodworth ",
    "This suit is from the grocery",
    "(unintelligible)",
    "I didn't get either uncle ",
    "Soundmen went to music mill",
    "I hope you're picked, and make it stick ",
    "Like palates of an asian girl ",
    "Have a day, everyday ",
    "Laser like a mangrove pearl",
    "Talking of my face ",
    "Handy dandy leap boot ",
    "Sandersville loveland ",
    "A bullard grumbled skeet shoot",
    "Leilah go low,",
    "Uncorking, litter-thinking ",
    "Scantily drab albinos |,,|The rest is for the best ",
    "The best are on the Death Star ",
    "That battlebrooke Neville Stamp ",
    "With tears for fears and tongues of tar",
    "",
  },
  {
    //Homework Sucks
    "",
    "new year, new tour",
    "same songs, the same four",
    "our music's stuck in limbo",
    "sustained by high school bimbos",
    "the drummer just quit",
    "sick of preteen bullshit",
    "our t-shirts on children",
    "who lack the breasts to fill them",
    "no one wants to be with you",
    "when you're bald at 32",
    "no one wants to be your friend",
    "when your youth is at an end",
    "life is gonna get you down",
    "and then you&apos;re 6 feet underground",
    "you're half the man your father was",
    "life is tough",
    "and homework sucks!",
    "My credit's abysmal",
    "My love life…",
    "dismal",
    "Taking prescriptions",
    "for my gambling addiction",
    "my fridge is barren",
    "just like my ex-wife Karen",
    "libido waning",
    "with each pound that I'm gaining",
    "no reason left to be alive",
    "when you're pushing 45",
    "and no one wants to be with you",
    "when your life is half way through",
    "life is gonna get you down",
    "as the green leaves turn to brown",
    "you're half the man you used to be",
    "life is fucked!",
    "and homework sucks",
    "",
  },
  {
  
  },
};

////////////////////LYRIC KEY\\\\\\\\\\\\\\\\\\\\
// 00. This Adventure's Happening
// 01. Cog
// 02. K.K. Rider
// 03. Government Name
// 04. Voodoo Dollhouse
// 05. Skeleton Crew
// 06. Every Word Rewritten
// 07. Stick Up
// 08. Tough Guy In New York
// 09. Coronation of the Damned
// 10. Free Brick
// 11. Reagan's Ghost
// 12. Wet Country
// 13. Marine Biologist
// 14. They'll Need a Crane
// 15. Meathook Fanclub
// 16. Non Sequitur
// 17. Finger of Justice
// 18. The Decider
// 19. The Autophobe
// 20. Polished to Perfection
// 21. Jackie Chan
// 22. Au Naturale
// 23. Cowtown
// 24. Portly Chap
// 25. Homework Sucks
////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\

//LOAD THE LYRICS
String[][] lyricssorted = { 
  lyrics[22],lyrics[2],lyrics[25]
};