class Currency < ActiveHash::Base
  self.data= [
    {id: 1, name: 'USD', symbol: '$'},
    {id: 2, name: 'EUR', symbol: '€'},
    {id: 3, name: 'GBP', symbol: '£'},
    {id: 4, name: 'JPY', symbol: '¥'},
    {id: 5, name: 'JOD', symbol: "د.ا"}
  ]
end
