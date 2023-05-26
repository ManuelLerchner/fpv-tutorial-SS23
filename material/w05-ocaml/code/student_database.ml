type grade = int * float

type student = {
  first_name : string;
  last_name : string;
  id : int;
  semester : int;
  grades : grade list;
}

let (manuel : student) =
  {
    first_name = "Manuel";
    last_name = "Lerchner";
    id = 2;
    semester = 4;
    grades = [];
  }

let (david : student) =
  {
    first_name = "David";
    last_name = "Test";
    id = 2;
    semester = 2;
    grades = [];
  }

type database = student list

let (db : database) = [ manuel; david ]
let insert (s : student) (db : database) = s :: db

let rec find_by_id (id : int) (db : database) =
  match db with
  | [] -> []
  | stud :: xs -> if stud.id = id then [ stud ] else find_by_id id xs

let find_by_last_name (name : string) (db : database) =
  List.find_all (fun stud -> stud.last_name = name) db

let rec find_by_last_name_2 (name : string) (db : database) =
  match db with
  | [] -> []
  | stud :: xs ->
      let remaining_students = find_by_last_name_2 name xs in
      if stud.last_name = name then stud :: remaining_students
      else remaining_students
