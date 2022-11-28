<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Support\Facades\DB;
use App\Models\Ticket;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
    
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
//use Maatwebsite\Excel\Concerns\FromCollection;

class TicketReport implements FromQuery, WithHeadings
{
    use Exportable;

    /**
    * @return \Illuminate\Support\Collection
    */
    protected $from_date;
    protected $to_date;
    
    function __construct($from_date,$to_date) {
                $this->from_date = $from_date;
                $this->to_date = $to_date;
        }
 

    public function query()
    {

        $data = DB::table('process_ticket')
->whereBetween('created_date',[ $this->from_date,$this->to_date])
->select('ticket_number','mobile','email_id','created_by','subject','category','status','source','department','owner','customer_name','remarks','created_at')
->orderBy('id');
    

        return $data;
    }
   
   public function headings(): array
        {
            return [
                'Ticket Number',
                'Mobile',
                'Email',
                'Created by',
                'Subject',
                'Category',
                'Status',
                'source ',
                'Department',
                'Owner',
                'Customer Name',
                'remarks',
                'Created Date'
            ];
        }



}
