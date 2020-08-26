unit AwImageGridReg;

interface

uses
  Classes, AwImageGrid, AwImageGridEdit, DesignIntf;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Awerdo', [TAwImageGrid]);
  RegisterPropertyEditor(TypeInfo(TPath), TAwImageGrid, 'Folder',
    TPathProperty);
end;

end.
