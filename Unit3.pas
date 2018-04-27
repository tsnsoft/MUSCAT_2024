unit Unit3;

interface

uses Windows, Forms, StdCtrls, Controls, Buttons, Classes, ExtCtrls;

type
  TForm3 = class(TForm)
    Panel2: TPanel;
    Memo1: TMemo;
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses unit1;  

{$R *.dfm}

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

end.

