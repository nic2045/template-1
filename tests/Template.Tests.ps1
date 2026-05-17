BeforeAll {
    Import-Module "$PSScriptRoot/../powershell/Template.psd1" -Force
}

Describe 'Get-Greeting' {
    It 'gibt Standard-Gruss zurueck' {
        Get-Greeting | Should -Be 'Hello, world!'
    }

    It 'gibt Gruss mit Namen zurueck' {
        Get-Greeting -Name 'Claude' | Should -Be 'Hello, Claude!'
    }
}
