// Navigation
// Stack -> LIFO(Last In First Out)


/*
Navigator.of(context).push();

  push(ScreenB)     push(ScreenC)

  |         |       |         |       |         |
  |         |       |         |       |*ScreenC |
  |         |  -->  |*ScreenB |  -->  | ScreenB |
  |*ScreenA |       | ScreenA |       | ScreenA |
  |_________|       |_________|       |_________|


*/



/*
Navigator.of(context).pop();
Navigator.of(context).popUntil();

  pop() <- ScreenC    pop() <- ScreenB

  |         |       |         |       |         |
  |*ScreenC |       |         |       |         |
  | ScreenB |  -->  |*ScreenB |  -->  |         |
  | ScreenA |       | ScreenA |       |*ScreenA |
  |_________|       |_________|       |_________|


*/

/*
Navigator.of(context).pushReplacement();

  - pushReplacement(ScreenC)

  |         |       |         |              
  |         |       |         |              
  |*ScreenB |  -->  |*ScreenC | 
  | ScreenA |       | ScreenA |     
  |_________|       |_________|

*/

/*
Navigator.of(context).pushAndRemoveUntil();

  - pushAndRemoveUntil(ScreenC).isFirst

  | ScreenD |       |         |              
  |*ScreenC |       |         |              
  | ScreenB |  -->  |*ScreenD | 
  | ScreenA |       | ScreenA |     
  |_________|       |_________|


  - pushAndRemoveUntil(false)

  |         |       |         | 
  |*ScreenC |       |         | 
  | ScreenB |  -->  |         | 
  | ScreenA |       |*ScreenA |     
  |_________|       |_________|        

*/


/*
Passing Arguments:

  1. Using Constructor
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ScreenB(data: dataFromScreenA),
        ),
      );

  2. Using Route argument
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ScreenB(),
          settings: const RouteSettings(
              arguments: dataFromScreenA
            ),
        ),
      );

*/


/*
Passing Data Back Using Navigator.pop() [ from ScreenB to ScreenA ]

  - in ScreenA
      final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ScreenB()),
            );

  - in ScreenB
      Navigator.pop(context, 'Data from ScreenB');

*/