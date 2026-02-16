pageextension 60152 "TCC User Task Card" extends "User Task Card"
{

    layout
    {
        addlast(factboxes)
        {

            part("MuM DZ DropZone Factbox"; "MuM DZ DropZone Factbox")
            {
                ApplicationArea = All;
                Caption = 'DropZone';
                SubPageLink = "User Task ID" = field(ID),
                              "Source Type" = const("TCC User Task");
            }
        }
    }

    actions
    {
        addlast(Processing)
        {
            action("MuM GRD Take Picture")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Caption = 'Take Picture';
                Image = Camera;
                ToolTip = ' ', Locked = true;

                trigger OnAction()
                var
                    MuMMSMediaStorage: Record "MuM MS Media Storage";
                    Camera: Page Camera;
                    PictureStream: InStream;
                    PictureName: Text[250];
                    CodeID: Code[20];
                begin
                    CodeID := format(Rec.ID);
                    Camera.SetAllowEdit(true);
                    Camera.RunModal();

                    Clear(MuMMSMediaStorage);
                    MuMMSMediaStorage.SetRange("Source Type", MuMMSMediaStorage."Source Type"::"TCC User Task");
                    MuMMSMediaStorage.SetRange(Code, CodeID);
                    if MuMMSMediaStorage.FindLast() then;

                    MuMMSMediaStorage."Source Type" := MuMMSMediaStorage."Source Type"::"TCC User Task";
                    MuMMSMediaStorage.Code := CodeID;
                    MuMMSMediaStorage."User Task ID" := Rec.ID;
                    MuMMSMediaStorage."Entry No." += 1;

                    PictureName := CodeID + '_' + Format(MuMMSMediaStorage."Entry No.") + '.jpg';

                    Camera.GetPicture(PictureStream);
                    MuMMSMediaStorage.Picture.ImportStream(PictureStream, PictureName);
                    MuMMSMediaStorage.Description := PictureName;
                    if not MuMMSMediaStorage.Insert() then
                        MuMMSMediaStorage.Modify();
                end;
            }
        }
    }
}
