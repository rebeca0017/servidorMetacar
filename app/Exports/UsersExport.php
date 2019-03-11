<?php

namespace App\Exports;

use App\Malla;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;

class UsersExport implements FromQuery
{
    /**
     * @return \Illuminate\Support\Collection
     */

    use Exportable;

    public function query()
    {
        return Malla::query();
    }
}
