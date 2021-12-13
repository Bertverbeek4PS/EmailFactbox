page 70100 "Sent Emails for Document"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sent Email";
    SourceTableTemporary = true;
    InsertAllowed = false;
    Editable = false;
    DeleteAllowed = false;
    CardPageId = "Email Viewer";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Mail Id"; 'Message from the ' + Format(rec.SystemCreatedAt))
                {
                    ApplicationArea = All;
                    Caption = 'Mail';
                    ToolTip = 'The Id of the Mail';
                }
            }
        }
    }

    procedure FillBuffer(var TempSendEmail: Record "Sent Email" temporary)
    begin
        rec.Copy(TempSendEmail, true);
        CurrPage.Update();
    end;

}