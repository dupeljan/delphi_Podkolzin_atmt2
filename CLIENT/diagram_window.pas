unit diagram_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,data_moudule, Data.DB, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TDIAGRAM_FORM = class(TForm)
    DateTimePicker_from: TDateTimePicker;
    DateTimePicker_to: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button_update: TButton;
    DataSource1: TDataSource;
    Image_daily_income: TImage;
    Image_loss: TImage;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    DataSource2: TDataSource;
    procedure Button_updateClick(Sender: TObject);
  private
    { Private declarations }
    procedure draw_daily_income;
    procedure draw_loss;
  public
    { Public declarations }
  end;

var
  DIAGRAM_FORM: TDIAGRAM_FORM;

implementation

{$R *.dfm}

function max_daily_income : integer;
var count,i,max : integer;
begin
   dm.qGet_global_period_daily_income.last;
   count := dm.qGet_global_period_daily_income.RecordCount;
   dm.qGet_global_period_daily_income.First;

   max := 0;
   for I := 0 to count - 1 do begin
      if max < dm.qGet_global_period_daily_income.FieldByName('PRICE').AsInteger then
        max := dm.qGet_global_period_daily_income.FieldByName('PRICE').AsInteger;
      dm.qGet_global_period_daily_income.next;
   end;

   result := max;

end;

function max_loss : integer;
var count,i,max : integer;
begin
   dm.qGet_global_period_loss.last;
   count := dm.qGet_global_period_loss.RecordCount;
   dm.qGet_global_period_loss.First;

   max := 0;
   for I := 0 to count - 1 do begin
      if max < dm.qGet_global_period_loss.FieldByName('PRICE').AsInteger then
        max := dm.qGet_global_period_loss.FieldByName('PRICE').AsInteger;
      dm.qGet_global_period_loss.next;
   end;

   result := max;

end;

procedure TDIAGRAM_FORM.draw_daily_income;
var max, h,w, record_count,i ,x ,y, price : integer;
margin : extended;
begin
  margin := 0.1;

   max := max_daily_income;
   h := Image_daily_income.Height;
   w := Image_daily_income.Width;

   dm.qGet_global_period_daily_income.last;
   record_count := dm.qGet_global_period_daily_income.RecordCount;

   if record_count <> 0 then begin
        // begin to draw
        dm.qGet_global_period_daily_income.First;


       for I := 0 to record_count - 1 do begin
          price := dm.qGet_global_period_daily_income.FieldByName('PRICE').asInteger;
          y := round( margin * h + (1 - price / max) * h * (1 - 2 * margin));
          x := round( margin * w + ( ( w * ( 1 - 2 * margin) ) / (record_count-1) ) * i );
          if i = 0 then
            Image_daily_income.Canvas.MoveTo(x,y)
          else
            Image_daily_income.Canvas.LineTo(x,y);
          dm.qGet_global_period_daily_income.Next;
       end;

   end;

end;

procedure TDIAGRAM_FORM.draw_loss;
var max, h,w, record_count,i ,x ,y, price : integer;
margin : extended;
begin
  margin := 0.1;

   max := max_loss;
   h := Image_loss.Height;
   w := Image_loss.Width;

   dm.qGet_global_period_loss.last;
   record_count := dm.qGet_global_period_loss.RecordCount;

   if record_count <> 0 then begin
      // begin to draw
       dm.qGet_global_period_loss.First;


       for I := 0 to record_count - 1 do begin
          price := dm.qGet_global_period_loss.FieldByName('PRICE').asInteger;
          y := round( margin * h + (1 - price / max) * h * (1 - 2 * margin));
          x := round( margin * w + ( ( w * ( 1 - 2 * margin) ) / (record_count-1) ) * i );
          if i = 0 then
            Image_loss.Canvas.MoveTo(x,y)
          else
            Image_loss.Canvas.LineTo(x,y);
          dm.qGet_global_period_loss.Next;
       end;
   end;



end;

procedure TDIAGRAM_FORM.Button_updateClick(Sender: TObject);
begin
  // setup daily income params
  dm.qGet_global_period_daily_income.ParamByName('IN_DATE_BEGIN_DATE').Value :=
  DateTimePicker_from.Date;
  dm.qGet_global_period_daily_income.ParamByName('IN_DATE_END_DATE').Value :=
  DateTimePicker_To.Date;
  // setup loss params
  dm.qGet_global_period_loss.ParamByName('IN_DATE_BEGIN_DATE').Value :=
  DateTimePicker_from.Date;
  dm.qGet_global_period_loss.ParamByName('IN_DATE_END_DATE').Value :=
  DateTimePicker_To.Date;
  // update all
  dm.update_all;
  // draw
  Image_daily_income.picture:= nil;
  draw_daily_income;
  Image_loss.Picture := nil;
  draw_loss;


end;

end.