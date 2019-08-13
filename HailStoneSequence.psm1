function Invoke-EvenNumberRoutine
{
    [CmdletBinding()]
    [OutputType([Int64])]
    param
    (
        [Parameter(Mandatory = $true)]
        [Int64]
        $Number
    )

    return $Number / 2
}

function Invoke-OddNumberRoutine
{
    [CmdletBinding()]
    [OutputType([Int64])]
    param
    (
        [Parameter(Mandatory = $true)]
        [Int64]
        $Number
    )

    return ($Number * 3) + 1
}

<#
    .SYNOPSIS
        Returns the HailStone Sequence
    .DESCRIPTION
        Returns the HailStone Number Sequence, or Collatz conjecture.  Wikipedia definition:
        Start with any positive integer n. Then each term is obtained from the previous term as follows:
        if the previous term is even, the next term is one half the previous term.
        If the previous term is odd, the next term is 3 times the previous term plus 1.
        The conjecture is that no matter what value of n, the sequence will always reach 1.
    .PARAMETER StartingNumber
        Any positive interger to start the HailStone / Collatz conjecture.
#>
function Get-HailStoneSequence
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [Int64]
        $StartingNumber
    )

    $number = $StartingNumber
    while ($number -ne 1)
    {
        try
        {
            switch ($number % 2)
            {
                0 {
                    $number = Invoke-EvenNumberRoutine -Number $number
                }

                1 {
                    $number = Invoke-OddNumberRoutine -Number $number
                }
            }
        }
        catch
        {
            throw $_
        }

        $number
    }
}

Export-ModuleMember -Function 'Get-HailStoneSequence'
