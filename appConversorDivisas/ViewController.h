//
//  ViewController.h
//  appConversorDivisas
//
//  Created by Guest User on 21/10/24.
//



#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textoEntrada;
@property (weak, nonatomic) IBOutlet UILabel *labelResultado;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerDivisas;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerOG;

@property (strong, nonatomic) NSArray *tipoDeCambio;

// Variable de instancia para almacenar la fila seleccionada en pickerOG
@property (nonatomic) NSInteger selectedRowOG;

@end
