int borderX;
int borderY;
int offsetX;
int offsetY;
String[] strings = { 
  "e", "b", "g", "d", "a", "e"
};
String[] notes = {
  "c", "c#", "d", "d#", "e", "f", "f#", 
  "g", "g#", "a", "a#", "b"
};
String theKey;

String int2note(int i) {
  return notes[i%12];
}

int note2int(String note) {
  int i = 0;
  for (String s : notes) {
    if (s.equals(note)) {
      return i % 12;
    }
    i++;
  }
  return 0;
}

class NotesIterator {
  int pos;
  NotesIterator(String stringStart) {
    pos = note2int(stringStart);
  }
  int get_first() {
    return pos++;
  }
  int next() {
    return pos++;
  }
}

boolean is_in(int note, String scale) {
  String[] thescale = {
  };
  String[] cscale = { 
    "c", "d", "e", "f", "g", "a", "b"
  };
  String[] dscale = { 
    "d", "e", "f#", "g", "a", "b", "c#"
  };
  String[] escale = { 
    "e", "f#", "g#", "a", "b", "c#", "d#"
  };
  String[] fscale = { 
    "f#", "g#", "a#", "b", "c#", "d#", "e#"
  };
  String[] gscale = { 
    "g", "a", "b", "c", "d", "e", "f#"
  };
  String[] ascale = { 
    "a", "b", "c#", "d", "e", "f#", "g#"
  };
  String[] bscale = { 
    "b", "c#", "d#", "e", "f#", "g#", "a#"
  };

  if (scale == "c")
    thescale = cscale;
  else if (scale == "d")
    thescale = dscale;
  else if (scale == "e")
    thescale = escale;
  else if (scale == "f")
    thescale = fscale;
  else if (scale == "g")
    thescale = gscale;
  else if (scale == "a")
    thescale = ascale;
  else if (scale == "b")
    thescale = bscale;


  for (String s : thescale) {
    if (note2int(s) == note%12) {
      return true;
    }
  }
  return false;
}

void setup() {
  size(650, 300);
  background(255);
  borderX = 20;
  borderY = 90;
  offsetX = (width - 2 * borderX) / 11;
  offsetY = (height - 2 * borderY) / 6;
  smooth();
  theKey = "c";
}

boolean is_in_circle(int cx, int cy, int x, int y, int r) {
  return sq((x - cx)) + sq((y - cy)) < sq(r);
}

void draw() {
  background(255);
  int istring = 0;

  for (int j = borderY; j < height - borderY; j += offsetY) {
    NotesIterator notes = new NotesIterator(strings[istring]);
    int note = notes.get_first();
    for (int i = borderX; i < width - borderX; i += offsetX) {
      if (is_in(note, theKey)) {
        fill(0);
      } else {
        fill(255);
      }
      if (is_in_circle(i, j, mouseX, mouseY, 10)) {
        fill(255, 0, 255);
        text(int2note(note), i + 10, j);
      }

      ellipse(i, j, 10, 10);
      note = notes.next();
    }
    istring++;
  }
  if (keyPressed) {
    //theKey = String.valueOf(key);
    //println(">>" + note2int(theKey) + "<<");
    switch(key) {
    case 'c':
      theKey = "c";
      break;
    case 'd':
      theKey = "d";
      break;
    case 'e':
      theKey = "e";
      break;
    case 'f':
      theKey = "f";
      break;
    case 'g':
      theKey = "g";
      break;
    case 'a':
      theKey = "a";
      break;
    case 'b':
      theKey = "b";
      break;
    }
  }

  fill(0);
  text(theKey, width/2, 45);
}

