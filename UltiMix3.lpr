program UltiMix3;

{UltiMix project for Raspberry Pi 3B                                       }
{                                                                              }
{To compile this project select Build, Run from the Lazarus menu               }
{                                                                              }
{History: Forked from UltiboDemo3			                     } 

{$mode delphi} {Default to Delphi compatible syntax}
{$H+}          {Default to AnsiString}

uses
 RaspberryPi3,
 GlobalConfig,
 GlobalConst,
 Platform,
 Threads,
 UltiMixMain,
 Logging,
 Console,
 ConsoleShell;
 
begin
 {Initialize ULtiMix3}
 if InitDemo then
  begin
   {Run the Demo}
   RunDemo;
   
   {When we return start the Console shell}
   CONSOLE_SHELL_ENABLED:=True;
   CONSOLE_SHELL_POSITION:=CONSOLE_POSITION_TOPRIGHT;
   ConsoleShellDeviceAdd(ConsoleDeviceGetDefault,False);
   
   {And start the Console logging}
   CONSOLE_REGISTER_LOGGING:=True;
   CONSOLE_LOGGING_POSITION:=CONSOLE_POSITION_BOTTOMRIGHT;
   LoggingConsoleDeviceAdd(ConsoleDeviceGetDefault);
   LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_CONSOLE));
   LoggingOutput('This is a log window, try connecting a USB device');

   { Try adding a system call }
   TrySystemCall;
  end;
  
 {Halt the Main thread if it ever returns here}
 ThreadHalt(0); 
end.
