unit AwImageGridEdit;

interface

uses
  DesignEditors, DesignIntf, SysUtils, Forms, FileCtrl, Windows, Dialogs;

type
  TPathProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

implementation

{ TPathProperty }

resourcestring
  SSelectImagesFolder = 'Select images folder';

function SelectFolder(const Caption: String; Root: WideString;
  var Path: String): Boolean;
{$IF CompilerVersion >= 18.5} {D2007}
var
  Dialog: TFileOpenDialog;
{$IFEND}
begin
{$IF CompilerVersion < 18.5}
  Result := SelectDirectory(Caption, Root, Path);
{$ELSE}
  if Win32MajorVersion < 6 then {no Vista}
    Result := SelectDirectory(Caption, Root, Path)
  else
  begin
    Result := False;
    Dialog := TFileOpenDialog.Create(nil);
    try
      Dialog.Title := Caption;
      Dialog.Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
      Dialog.DefaultFolder := Root;
      Dialog.FileName := Path;
      Result := Dialog.Execute;
      if Result then
        Path := Dialog.FileName;
    finally
      Dialog.Free;
    end;
  end;
{$IFEND}
end;

procedure TPathProperty.Edit;
var
  Path: String;
begin
  Path := Value;
  if SelectFolder(SSelectImagesFolder, '', Path) then
    Value := Path;
end;

function TPathProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paMultiSelect, paRevertable];
end;

end.
