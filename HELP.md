```
  _________                           _________
 /   _____/ ____ _____ _______   ____ \_   ___ \_______  ______  _  __
 \_____  \_/ ___\\__  \\_  __ \_/ __ \/    \  \/\_  __ \/  _ \ \/ \/ /
 /        \  \___ / __ \|  | \/\  ___/\     \____|  | \(  <_> )     /
/_______  /\___  >____  /__|    \___  >\______  /|__|   \____/ \/\_/
	\/     \/     \/            \/        \/
							(@Tyl0us)
	“Fear, you must understand is more than a mere obstacle.
	Fear is a TEACHER. the first one you ever had.”

Usage of /go/bin/ScareCrow:
  -Evasion string
    	Sets the type of EDR unhooking technique:
    	[*] Disk - Retrives a clean version of the DLLs ".text" field from files stored on disk.
    	[*] KnownDLL - Retrives a clean version of the DLLs ".text" field from the KnownDLLs directory in the object namespace.
    	[*] None - The Loader that WILL NOT removing the EDR hooks in system DLLs and only use custom syscalls. (default "Disk")
  -Exec string
    	Set the template to execute the shellcode:
    	[*] RtlCopy - Using RtlCopy to move the shellcode into the allocated address in the current running process by making a Syscall.
    	[*] ProcessInjection - Process Injection Mode.
    	[*] NtQueueApcThreadEx - Executes the shellcode by creating an asynchronous procedure call (APC) to a target thread.
    	[*] VirtualAlloc - Allocates shellcode into the process using custom syscalls in the current running process (default "RtlCopy")
  -I string
    	Path to the raw 64-bit shellcode.
  -Loader string
    	Sets the type of process that will sideload the malicious payload:
    	[*] binary - Generates a binary based payload. (This type does not benefit from any sideloading)
    	[*] control - Loads a hidden control applet - the process name would be rundll32 if -O is specified a JScript loader will be generated.
    	[*] dll - Generates just a DLL file. Can be executed with commands such as rundll32 or regsvr32 with DllRegisterServer, DllGetClassObject as export functions.
    	[*] excel - Loads into a hidden Excel process using a JScript loader.
    	[*] msiexec - Loads into MSIexec process using a JScript loader.
    	[*] wscript - Loads into WScript process using a JScript loader. (default "binary")
  -O string
    	Name of output file (e.g. loader.js or loader.hta). If Loader is set to dll or binary this option is not required.
  -clone string
    	Path to the file containing the certificate you want to clone
  -configfile string
    	The path to a json based configuration file to generate custom file attributes. This will not use the default ones.
  -console
    	Only for Binary Payloads - Generates verbose console information when the payload is executed. This will disable the hidden window feature.
  -delivery string
    	Generates a one-liner command to download and execute the payload remotely:
    	[*] bits - Generates a Bitsadmin one liner command to download, execute and remove the loader (Compatible with Binary, Control, Excel, and Wscript Loaders).
    	[*] hta - Generates a blank hta file containing the loader along with an MSHTA command to execute the loader remotely in the background (Compatible with Control and Excel Loaders).
    	[*] macro - Generates an office macro that will download and execute the loader remotely (Compatible with Control, Excel, and Wscript Loaders).
  -domain string
    	The domain name to use for creating a fake code signing cert. (e.g. www.acme.com)
  -encryptionmode string
    	Sets the type of encryption to encrypt the shellcode:
    		[*] AES - Enables AES 256 encryption.
    		[*] ELZMA - Enables ELZMA encryption.
    		[*] RC4 - Enables RC4 encryption. (default "ELZMA")
  -export string
    	For DLL Loaders Only - Specify an Export function for a loader to have.
  -injection string
    	Enables Process Injection Mode and specify the path to the process to create/inject into (use \ for the path).
  -noamsi
    	Disables the AMSI patching that prevents AMSI BufferScanner.
  -noetw
    	Disables the ETW patching that prevents ETW events from being generated.
  -nosign
    	Disables file signing, making -domain/-valid/-password parameters not required.
  -nosleep
    	Disables the sleep delay before the loader unhooks and executes the shellcode.
  -obfu
    	Enables Garbles Literal flag replaces golang libray strings with more complex variants, resolving to the same value at run-time. This creates a larger loader and times longer to compile
  -outpath string
    	The path to put the final Payload/Loader once it's compiled.
  -password string
    	The password for code signing cert. Required when -valid is used.
  -sandbox
    	Enables sandbox evasion using IsDomainJoined calls.
  -url string
    	URL associated with the Delivery option to retrieve the payload. (e.g. https://acme.com/)
  -valid string
    	The path to a valid code signing cert. Used instead -domain if a valid code signing cert is desired.
```
