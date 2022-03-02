# Erzeugen des CentralPolicyStore

1. Auf dem aktuellsten eingesetzten Server unter **C:\Windows** den Ordner **PolicyDefinitions** kopieren und auf einem Domänencontroller unter **C:\Windows\SYSVOL\domain\Policies** einfügen

2. ADMX Datei des aktuellsten Client System herunterladen und entpacken oder den PolicyDefinitions Ordner vom Client mit der aktuellesten eingesetzten Version kopieren. Den Inhalt in das Verzeichnis **C:\Windows\SYSVOL\domain\Policies\PolicyDefinitions** einfügen. Wichtig ist hierbei das überschreiben der vorhanden Dateien.

3. Optional weitere ADMX Dateien in den Central Store mit reinkopieren wie z.B. von Office, Firefox oder Chrome