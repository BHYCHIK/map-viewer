unit terrain;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls;

type
  TPolygonPoint = record
    X: Extended;
    Y: Extended;
    Z: Extended;
    RealHeight: Extended;
  end;

  TPolygon = record
    Point1: Extended;
    Point2: Extended;
    Point3: Extended;
  end;

  TPolygonPoints = array of array of TPolygonPoint;

  function OpenTerrain(const path: String): TPolygonPoints;
  procedure DrawWire(const Model: TPolygonPoints;
                   const Camera: TPolygonPoint;
                   const Alpha, Beta: extended;
                   var landscape: TBitmap);

implementation

function OpenTerrain(const path: String): TPolygonPoints;
const
  Modifier = 15;
var
  map: TBitmap;
  X, Y: Integer;
begin
  map := TBitmap.Create;
  map.LoadFromFile(path);
  SetLength(result, map.Width, map.Height);
  for X := Low(Result) to High(Result) do
  begin
    for Y := Low(Result[x]) to High(Result[x]) do
    begin
      result[x, y].X := X * Modifier;
      result[x, y].Y := Y * Modifier;
      result[x, y].Z := getRValue(map.Canvas.Pixels[X, Y]) * Modifier;
    end;
  end;
  map.Free;
end;

function CentralProjectionOfPoint(point: TPolygonPoint;
    const camera: TPolygonPoint;
    Alpha, Beta: extended): TPolygonPoint;
var
  CosAlpha, CosBeta, SinAlpha, SinBeta: Extended;
  Zplane: Extended;
begin
  Alpha := Alpha * PI / 180.0;
  Beta := Beta * PI / 180.0;

  Zplane := camera.Z - 9000;

  CosAlpha := Cos(Alpha);
  CosBeta := Cos(Beta);
  SinAlpha := Sin(Alpha);
  SinBeta := Sin(Beta);

  point.X := point.X - camera.X;
  point.Y := point.Y - camera.Y;

  result.X := point.X * CosAlpha - point.Y * SinAlpha;
  result.Y := point.X * SinAlpha * CosBeta + point.Y * CosAlpha * CosBeta
              - point.Z * SinBeta;
  result.Z := point.X * SinAlpha * SinBeta + point.Y * CosAlpha * SinBeta
              + point.Z * CosBeta;


  result.X := result.X * (camera.Z - Zplane)/(camera.Z - result.Z);
  result.Y := result.Y * (camera.Z - Zplane)/(camera.Z - result.Z);
  result.Z := result.Z - Zplane;
end;

function AxonometricProjectionOfPoint(point: TPolygonPoint;
    const camera: TPolygonPoint;
    Alpha, Beta: extended): TPolygonPoint;
begin
  Alpha := Alpha * PI / 180.0;
  Beta := Beta * PI / 180.0;

  point.X := point.X - camera.X;
  point.Y := point.Y - camera.Y;

  result.X := (point.X * cos(Alpha) - point.Y * sin(Alpha)) * camera.Z;
  result.Y := (point.X * sin(Alpha) * cos(Beta) + point.Y * cos(Alpha)* cos(Beta)
              - point.Z * sin(Beta)) * camera.Z;
  result.Z := (point.X * sin(Alpha) * sin(Beta) + point.Y * cos(Alpha)* sin(Beta)
              + point.Z * cos(Beta)) * camera.Z;
end;

function CentralProjectionOfModel(const model: TPolygonPoints;
    const camera: TPolygonPoint;
    const Alpha, Beta: extended): TPolygonPoints;
var
  X, Y: Integer;
begin
  SetLength(result, High(model) + 1, High(model[High(model)]) + 1);
  for X := Low(model) to High(model) do
  begin
    for Y := Low(model[Low(model)]) to High(model[Low(model)]) do
    begin
      result[X, Y] := CentralProjectionOfPoint(model[X, Y], camera, Alpha, Beta);
    end;
  end;
end;

procedure DrawWire(const Model: TPolygonPoints;
                   const Camera: TPolygonPoint;
                   const Alpha, Beta: extended;
                   var landscape: TBitmap);
var
  Projection: TPolygonPoints;
  X, Y: Integer;
  wdth, hgth: Integer;
begin
  Projection := CentralProjectionOfModel(Model, Camera, Alpha, Beta);

  landscape.canvas.Brush.Color := clwhite;
  landscape.canvas.Brush.Style := bsSolid;
  landscape.canvas.Rectangle(-10, -10, 10000, 10000);
  landscape.Canvas.Pen.Width := 1;

  wdth := landscape.Width div 2;
  hgth := landscape.Height div 2;

  for X := Low(model) to High(model) - 1 do
  begin
    for Y := Low(model[Low(model)]) to High(model[Low(model)]) - 1 do
    begin
      with landscape do
      begin
      canvas.MoveTo(wdth + Round(Projection[X, Y].X), hgth + Round(Projection[X, Y].Y));
      canvas.LineTo(wdth + Round(Projection[X + 1, Y].X), hgth + Round(Projection[X + 1, Y].Y));

      canvas.MoveTo(wdth + Round(Projection[X, Y].X), hgth + Round(Projection[X, Y].Y));
      canvas.LineTo(wdth + Round(Projection[X, Y + 1].X), hgth + Round(Projection[X, Y + 1].Y));

      canvas.MoveTo(wdth + Round(Projection[X, Y + 1].X), hgth + Round(Projection[X, Y + 1].Y));
      canvas.LineTo(wdth + Round(Projection[X + 1, Y].X), hgth + Round(Projection[X + 1, Y].Y));

      canvas.MoveTo(wdth + Round(Projection[X, Y + 1].X), hgth + Round(Projection[X, Y + 1].Y));
      canvas.LineTo(wdth + Round(Projection[X + 1, Y + 1].X), hgth + Round(Projection[X + 1, Y + 1].Y));

      canvas.MoveTo(wdth + Round(Projection[X + 1, Y].X), hgth + Round(Projection[X + 1, Y].Y));
      canvas.LineTo(wdth + Round(Projection[X + 1, Y + 1].X), hgth + Round(Projection[X + 1, Y + 1].Y));
      end;
    end;
  end;
end;

end.
