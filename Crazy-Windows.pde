int ledPin = 11;
int windows = 2;

void setup(){
}

void loop(){
  // Start
  delay(3000);
  digitalWrite(ledPin, HIGH);

  // Exploit
  //LinuxPayload();
  WindowsPayload();

  // End
  digitalWrite(ledPin, LOW);
  delay(15000); // Long delay between runs
}

// Specific functions
void LinuxPayload(){
  GnomeKDECommandRun("xterm");
  delay(1500);
  KeyCombo(MODIFIERKEY_ALT,KEY_F7);
  moveWindow();

  Mouse.click();
}

void WindowsPayload(){
  WindowsCommandRun("explorer.exe");
  delay(1500);
  // Alt + Space + L
  KeyCombo(MODIFIERKEY_ALT,KEY_SPACE);
  delay(100);
  KeyPress(KEY_L);
  delay(100);
  // Click and Drag
  Mouse.set_buttons(1, 0, 0);
  moveWindow();

  Mouse.set_buttons(0, 0, 0);
}

void moveWindow(){
  int d = 0;
  int m = 80;
  int i;
  while(true){
    for (i=0; i<m; i++){
      Mouse.move(2, 2);
      delay(d);
    }
    for (i=0; i<m; i++){
      Mouse.move(-4, 1);
      delay(d);
    }
    for (i=0; i<m; i++){
      Mouse.move(2, -3);
      delay(d);
    }
  }
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
  delay(1000);

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








