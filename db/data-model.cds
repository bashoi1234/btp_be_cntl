namespace btp.c;

using {cuid} from '@sap/cds/common';

entity Assessments : cuid {
                AgendaId                  : String(30);
                Agenda                    : String(50) @mandatory;
                StartDate                 : Date       @mandatory;
                EndDate                   : Date       @mandatory;
                DueDate                   : Date       @mandatory;
                DaysPlanned               : Integer    @assert.range: [
                        7,
                        21
                ];

        virtual OverallStatus            : String(50); // Virtual Element - calculated by customer logic - overdue /on track / completed
        virtual OverallStatusCriticality : Integer;
                IsObsolete                : Boolean;
                ReasonComment             : String(50);
}

@cds.persistence.skip
entity OUTPUT_DATA {
        key ID      : String(36);
            COLUMN1 : String(255);
            COLUMN2 : String(255);
            COLUMN3 : String(255);
}

//Media
entity MediaFile:cuid{
        @Core.MediaType : mediaType
        content : LargeBinary; // Raws String
        @Core.IsMediaType: true
        mediaType : String;
        @Core.ContentDisposition.Filename:fileName
        fileName : String;
}
