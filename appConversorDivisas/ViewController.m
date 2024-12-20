//
//  ViewController.m
//  appConversorDivisas
//
//  Created by Guest User on 21/10/24.
//


#import "ViewController.h"

@interface ViewController (){
    NSArray *divisasPaises;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Inicializar el arreglo de divisas
    divisasPaises = @[@"Australia🇦🇺", @"China🇨🇳", @"Francia🇫🇷", @"Inglaterra🏴", @"Japon🇯🇵", @"Mexico🇲🇽", @"Suiza"];
    
    // Inicializar el arreglo de tipo de cambio
    _tipoDeCambio = @[
        @1.50,  // Australia
        @7.11,  // China
        @0.92,  // Francia
        @0.77,  // Inglaterra
        @150.48,// Japon
        @20.5,  // Mexico
        @0.87   // Suiza
    ];
    
    // Asignar el dataSource y delegate para ambos pickers
    self.pickerDivisas.dataSource = self;
    self.pickerDivisas.delegate = self;
    self.pickerOG.dataSource = self;
    self.pickerOG.delegate = self;
    
    // Inicializar selectedRowOG en 0 (primer valor seleccionado)
    _selectedRowOG = 0;
    
    // Llamar a la conversión inicial
    [self actualizarConversion];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return divisasPaises.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return divisasPaises[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == self.pickerOG) {
        
        _selectedRowOG = row;  // Actualizar la fila seleccionada de pickerOG
    }
    
    // Actualizar la conversión cada vez que se cambie una selección
    [self actualizarConversion];
}



- (void)actualizarConversion {
  
    float valorOriginal = [self.textoEntrada.text floatValue];
    
 
    if (valorOriginal == 0) {
        valorOriginal = 1.0;  // Valor por defecto si no se ingresa un número válido
    }

    
    NSInteger selectedRowDivisa = [self.pickerDivisas selectedRowInComponent:0]; // Divisa de destino
    
    // Obtener el tipo de cambio correspondiente a cada divisa
    float tipoDeCambioOG = [_tipoDeCambio[_selectedRowOG] floatValue];   // Tipo de cambio de la divisa origen
    float tipoDeCambioDivisa = [_tipoDeCambio[selectedRowDivisa] floatValue]; // Tipo de cambio de la divisa destino
    
    // Realizar la conversión
    float valorConvertido = valorOriginal * tipoDeCambioOG / tipoDeCambioDivisa;
    
   
    self.labelResultado.text = [NSString stringWithFormat:@"%.2f", valorConvertido];
}

@end
