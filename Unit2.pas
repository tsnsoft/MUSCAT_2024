unit Unit2;

interface

uses  Windows, Forms, Controls, StdCtrls, FileCtrl, Buttons, Classes,
  ExtCtrls, shellapi;

type
  TForm2 = class(TForm)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StaticText1: TStaticText;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses unit1;

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
  DirectoryListBox1Change(Sender);
  StaticText1.Caption:='';
end;

procedure TForm2.DirectoryListBox1Change(Sender: TObject);
const t=45;
var s,s1: string; x: integer;
begin
  s:=DirectoryListBox1.Directory; x:=length(s);
  if x>t then begin
      s1:=copy(s,1,3)+' .. '; delete(s,1,x-t+7); s:=' '+s1+s;
  end; Statictext1.caption:=s;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  DriveComboBox1.Update; DirectoryListBox1.Update;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var s: string;
begin
  s:=DirectoryListBox1.Directory;
  if s[length(s)]<>'\' then s:=s+'\';
  form1.Edit_NF_Folder.text:=s;
  form1.Edit_NF_Folder.SelStart:=length(form1.Edit_NF_Folder.Text);
  close;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  ShellExecute(handle, nil, pwidechar(DirectoryListBox1.Directory),
     nil, nil, SW_SHOWNORMAL);
end;

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#27 then close;
end;

end.

