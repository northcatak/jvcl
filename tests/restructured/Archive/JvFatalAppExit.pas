{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvFatalAppExit.PAS, released on 2001-02-28.

The Initial Developer of the Original Code is S�bastien Buysse [sbuysse@buypin.com]
Portions created by S�bastien Buysse are Copyright (C) 2001 S�bastien Buysse.
All Rights Reserved.

Contributor(s): Michael Beck [mbeck@bigfoot.com].

Last Modified: 2000-02-28

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$I JEDI.INC}

unit JvFatalAppExit;

{$OBJEXPORTALL On}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  JvBaseDlg, JvTypes;

type
  TJvFatalAppExit = class(TJvCommonDialogP)
  private
    FText: string;
  published
    property Text: string read FText write FText;
    procedure Execute; override;
  end;

resourcestring
  SCannotExecuteAtDesign = 'Unable to call Execute at design-time!';
    
implementation

{**************************************************}

procedure TJvFatalAppExit.Execute;
begin
  if (csDesigning in ComponentState) then
    ShowMessage(SCannotExecuteAtDesign)
  else
    FatalAppExit(0, PChar(FText));
end;

end.