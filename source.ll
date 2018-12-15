; ModuleID = 'Coral'
source_filename = "Coral"

%CType.12 = type { %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*)*, %CObj.9* (%CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9**)* }
%CObj.9 = type { i8*, %CType.12* }
%CList.10 = type { i8*, i32, i32 }

@ctype_func = global %CType.12 { %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*)* null, %CObj.9* (%CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9**)* @func_call }
@ctype_int = global %CType.12 { %CObj.9* (%CObj.9*, %CObj.9*)* @int_add, %CObj.9* (%CObj.9*, %CObj.9*)* @int_sub, %CObj.9* (%CObj.9*, %CObj.9*)* @int_mul, %CObj.9* (%CObj.9*, %CObj.9*)* @int_div, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* @int_eq, %CObj.9* (%CObj.9*, %CObj.9*)* @int_neq, %CObj.9* (%CObj.9*, %CObj.9*)* @int_lesser, %CObj.9* (%CObj.9*, %CObj.9*)* @int_leq, %CObj.9* (%CObj.9*, %CObj.9*)* @int_greater, %CObj.9* (%CObj.9*, %CObj.9*)* @int_geq, %CObj.9* (%CObj.9*, %CObj.9*)* @int_and, %CObj.9* (%CObj.9*, %CObj.9*)* @int_or, %CObj.9* (%CObj.9*)* @int_neg, %CObj.9* (%CObj.9*)* @int_not, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9**)* null }
@ctype_float = global %CType.12 { %CObj.9* (%CObj.9*, %CObj.9*)* @float_add, %CObj.9* (%CObj.9*, %CObj.9*)* @float_sub, %CObj.9* (%CObj.9*, %CObj.9*)* @float_mul, %CObj.9* (%CObj.9*, %CObj.9*)* @float_div, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* @float_eq, %CObj.9* (%CObj.9*, %CObj.9*)* @float_neq, %CObj.9* (%CObj.9*, %CObj.9*)* @float_lesser, %CObj.9* (%CObj.9*, %CObj.9*)* @float_leq, %CObj.9* (%CObj.9*, %CObj.9*)* @float_greater, %CObj.9* (%CObj.9*, %CObj.9*)* @float_geq, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*)* @float_neg, %CObj.9* (%CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9**)* null }
@ctype_bool = global %CType.12 { %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* @bool_eq, %CObj.9* (%CObj.9*, %CObj.9*)* @bool_neq, %CObj.9* (%CObj.9*, %CObj.9*)* @bool_lesser, %CObj.9* (%CObj.9*, %CObj.9*)* @bool_leq, %CObj.9* (%CObj.9*, %CObj.9*)* @bool_greater, %CObj.9* (%CObj.9*, %CObj.9*)* @bool_geq, %CObj.9* (%CObj.9*, %CObj.9*)* @bool_and, %CObj.9* (%CObj.9*, %CObj.9*)* @bool_or, %CObj.9* (%CObj.9*)* @bool_neg, %CObj.9* (%CObj.9*)* @bool_not, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9**)* null }
@ctype_char = global %CType.12 { %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* @char_eq, %CObj.9* (%CObj.9*, %CObj.9*)* @char_neq, %CObj.9* (%CObj.9*, %CObj.9*)* @char_lesser, %CObj.9* (%CObj.9*, %CObj.9*)* @char_leq, %CObj.9* (%CObj.9*, %CObj.9*)* @char_greater, %CObj.9* (%CObj.9*, %CObj.9*)* @char_geq, %CObj.9* (%CObj.9*, %CObj.9*)* @char_and, %CObj.9* (%CObj.9*, %CObj.9*)* @char_or, %CObj.9* (%CObj.9*)* null, %CObj.9* (%CObj.9*)* @char_not, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9**)* null }
@ctype_list = global %CType.12 { %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* null, %CObj.9* (%CObj.9*)* null, %CObj.9* (%CObj.9*)* null, %CObj.9* (%CObj.9*, %CObj.9*)* @list_idx, %CObj.9* (%CObj.9*, %CObj.9**)* null }
@x = global %CObj.9* null
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"

define %CObj.9* @int_add(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = add i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_int, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_sub(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = sub i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_int, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_mul(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = mul i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_int, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_div(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = sdiv i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_int, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_eq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp eq i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_neq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp ne i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_lesser(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp slt i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_leq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp sle i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_greater(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp sgt i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_geq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp sge i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_and(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = and i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_int, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_or(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = or i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_int, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_neg(%CObj.9* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %result_data = sub i32 0, %data
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall2 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_int, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @int_not(%CObj.9* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %result_data = xor i32 %data, -1
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall2 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_int, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_add(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fadd double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to double*
  %dataptr_as_i8 = bitcast double* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_float, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store double %result_data, double* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_sub(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fsub double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to double*
  %dataptr_as_i8 = bitcast double* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_float, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store double %result_data, double* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_mul(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fmul double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to double*
  %dataptr_as_i8 = bitcast double* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_float, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store double %result_data, double* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_div(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fdiv double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to double*
  %dataptr_as_i8 = bitcast double* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_float, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store double %result_data, double* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_eq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp ueq double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_neq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp une double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_lesser(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp ult double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_leq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp ule double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_greater(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp ugt double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_geq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp uge double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @float_neg(%CObj.9* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %result_data = fsub double -0.000000e+00, %data
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall2 to double*
  %dataptr_as_i8 = bitcast double* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_float, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store double %result_data, double* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @bool_eq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp eq i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @bool_neq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp eq i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @bool_lesser(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp slt i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @bool_leq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp sle i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @bool_greater(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp sgt i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @bool_geq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp sge i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @bool_and(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = and i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @bool_or(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = or i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @bool_neg(%CObj.9* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %result_data = sub i1 false, %data
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall2 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @bool_not(%CObj.9* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %result_data = xor i1 %data, true
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall2 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @char_eq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp eq i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @char_neq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp eq i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @char_lesser(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp slt i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @char_leq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp sle i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @char_greater(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp sgt i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @char_geq(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp sge i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_bool, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @char_and(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = add i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %__new_dataptr = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_char, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %__new_dataptr, i8** %datafieldptr
  store i8 %result_data, i8* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @char_or(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = or i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %__new_dataptr = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_char, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %__new_dataptr, i8** %datafieldptr
  store i8 %result_data, i8* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @char_not(%CObj.9* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %result_data = xor i8 %data, -1
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %__new_dataptr = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_char, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %__new_dataptr, i8** %datafieldptr
  store i8 %result_data, i8* %__new_dataptr
  ret %CObj.9* %__new_objptr
}

define %CObj.9* @list_idx(%CObj.9* %remote_self_p, %CObj.9* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %other_p_p = alloca %CObj.9*
  store %CObj.9* %remote_other_p, %CObj.9** %other_p_p
  %other_p_p2 = load %CObj.9*, %CObj.9** %other_p_p
  %__gep_addr = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %__objptr = load i8*, i8** %__gep_addr
  %__clistptr = bitcast i8* %__objptr to %CList.10*
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %other_p_p2, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %__gep_addr3 = getelementptr inbounds %CList.10, %CList.10* %__clistptr, i32 0, i32 2
  %__capacity = load i32, i32* %__gep_addr3
  %__inbounds = icmp slt i32 %data, %__capacity
  %__gep_addr4 = getelementptr inbounds %CList.10, %CList.10* %__clistptr, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr = bitcast i8** %__gep_addr4 to %CObj.9***
  %__gep_addr_as_cobjptrptr = load %CObj.9**, %CObj.9*** %__gep_addr_as_cobjptrptrptr
  %__gep_addr_as_cobjptrptr5 = getelementptr %CObj.9*, %CObj.9** %__gep_addr_as_cobjptrptr, i32 %data
  %__cobjptr = load %CObj.9*, %CObj.9** %__gep_addr_as_cobjptrptr5
  ret %CObj.9* %__cobjptr
}

define %CObj.9* @func_call(%CObj.9* %remote_self_p, %CObj.9** %remote_argv) {
entry:
  %self_p_p = alloca %CObj.9*
  store %CObj.9* %remote_self_p, %CObj.9** %self_p_p
  %self_p_p1 = load %CObj.9*, %CObj.9** %self_p_p
  %argv_p = alloca %CObj.9**
  store %CObj.9** %remote_argv, %CObj.9*** %argv_p
  %argv = load %CObj.9**, %CObj.9*** %argv_p
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %fnptr = bitcast i8* %x3 to %CObj.9* (%CObj.9**)*
  %result = call %CObj.9* %fnptr(%CObj.9** %argv)
  ret %CObj.9* %result
}

declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj.9*
  %__new_dataptr = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 1
  store %CType.12* @ctype_char, %CType.12** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr, i32 0, i32 0
  store i8* %__new_dataptr, i8** %datafieldptr
  store i8 104, i8* %__new_dataptr
  %malloccall2 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr3 = bitcast i8* %malloccall2 to %CObj.9*
  %__new_dataptr5 = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr6 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr3, i32 0, i32 1
  store %CType.12* @ctype_char, %CType.12** %ctypefieldptr6
  %datafieldptr7 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr3, i32 0, i32 0
  store i8* %__new_dataptr5, i8** %datafieldptr7
  store i8 101, i8* %__new_dataptr5
  %malloccall8 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr9 = bitcast i8* %malloccall8 to %CObj.9*
  %__new_dataptr11 = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr12 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr9, i32 0, i32 1
  store %CType.12* @ctype_char, %CType.12** %ctypefieldptr12
  %datafieldptr13 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr9, i32 0, i32 0
  store i8* %__new_dataptr11, i8** %datafieldptr13
  store i8 108, i8* %__new_dataptr11
  %malloccall14 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr15 = bitcast i8* %malloccall14 to %CObj.9*
  %__new_dataptr17 = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr18 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr15, i32 0, i32 1
  store %CType.12* @ctype_char, %CType.12** %ctypefieldptr18
  %datafieldptr19 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr15, i32 0, i32 0
  store i8* %__new_dataptr17, i8** %datafieldptr19
  store i8 108, i8* %__new_dataptr17
  %malloccall20 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr21 = bitcast i8* %malloccall20 to %CObj.9*
  %__new_dataptr23 = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr24 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr21, i32 0, i32 1
  store %CType.12* @ctype_char, %CType.12** %ctypefieldptr24
  %datafieldptr25 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr21, i32 0, i32 0
  store i8* %__new_dataptr23, i8** %datafieldptr25
  store i8 111, i8* %__new_dataptr23
  %malloccall26 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr27 = bitcast i8* %malloccall26 to %CObj.9*
  %malloccall28 = tail call i8* @malloc(i32 ptrtoint (%CList.10* getelementptr (%CList.10, %CList.10* null, i32 1) to i32))
  %__new_dataptr29 = bitcast i8* %malloccall28 to %CList.10*
  %dataptr_as_i8 = bitcast %CList.10* %__new_dataptr29 to i8*
  %ctypefieldptr30 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr27, i32 0, i32 1
  store %CType.12* @ctype_list, %CType.12** %ctypefieldptr30
  %datafieldptr31 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr27, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr31
  %malloccall32 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 10) to i32))
  %__new_dataptr33 = bitcast i8* %malloccall32 to [10 x %CObj.9*]*
  %dataptr_as_i834 = bitcast [10 x %CObj.9*]* %__new_dataptr33 to i8*
  %__elem_ptr = getelementptr [10 x %CObj.9*], [10 x %CObj.9*]* %__new_dataptr33, i32 0, i32 0
  store %CObj.9* %__new_objptr, %CObj.9** %__elem_ptr
  %__elem_ptr35 = getelementptr [10 x %CObj.9*], [10 x %CObj.9*]* %__new_dataptr33, i32 0, i32 1
  store %CObj.9* %__new_objptr3, %CObj.9** %__elem_ptr35
  %__elem_ptr36 = getelementptr [10 x %CObj.9*], [10 x %CObj.9*]* %__new_dataptr33, i32 0, i32 2
  store %CObj.9* %__new_objptr9, %CObj.9** %__elem_ptr36
  %__elem_ptr37 = getelementptr [10 x %CObj.9*], [10 x %CObj.9*]* %__new_dataptr33, i32 0, i32 3
  store %CObj.9* %__new_objptr15, %CObj.9** %__elem_ptr37
  %__elem_ptr38 = getelementptr [10 x %CObj.9*], [10 x %CObj.9*]* %__new_dataptr33, i32 0, i32 4
  store %CObj.9* %__new_objptr21, %CObj.9** %__elem_ptr38
  %__elem_ptr39 = getelementptr [10 x %CObj.9*], [10 x %CObj.9*]* %__new_dataptr33, i32 0, i32 5
  store %CObj.9* null, %CObj.9** %__elem_ptr39
  %__elem_ptr40 = getelementptr [10 x %CObj.9*], [10 x %CObj.9*]* %__new_dataptr33, i32 0, i32 6
  store %CObj.9* null, %CObj.9** %__elem_ptr40
  %__elem_ptr41 = getelementptr [10 x %CObj.9*], [10 x %CObj.9*]* %__new_dataptr33, i32 0, i32 7
  store %CObj.9* null, %CObj.9** %__elem_ptr41
  %__elem_ptr42 = getelementptr [10 x %CObj.9*], [10 x %CObj.9*]* %__new_dataptr33, i32 0, i32 8
  store %CObj.9* null, %CObj.9** %__elem_ptr42
  %__elem_ptr43 = getelementptr [10 x %CObj.9*], [10 x %CObj.9*]* %__new_dataptr33, i32 0, i32 9
  store %CObj.9* null, %CObj.9** %__elem_ptr43
  %datafieldptr44 = getelementptr inbounds %CList.10, %CList.10* %__new_dataptr29, i32 0, i32 0
  store i8* %dataptr_as_i834, i8** %datafieldptr44
  %lenfieldptr = getelementptr inbounds %CList.10, %CList.10* %__new_dataptr29, i32 0, i32 1
  store i32 5, i32* %lenfieldptr
  %capfieldptr = getelementptr inbounds %CList.10, %CList.10* %__new_dataptr29, i32 0, i32 2
  store i32 10, i32* %capfieldptr
  store %CObj.9* %__new_objptr27, %CObj.9** @x
  %x = load %CObj.9*, %CObj.9** @x
  %malloccall45 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr46 = bitcast i8* %malloccall45 to %CObj.9*
  %malloccall47 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr48 = bitcast i8* %malloccall47 to i32*
  %dataptr_as_i849 = bitcast i32* %__new_dataptr48 to i8*
  %ctypefieldptr50 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr46, i32 0, i32 1
  store %CType.12* @ctype_int, %CType.12** %ctypefieldptr50
  %datafieldptr51 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr46, i32 0, i32 0
  store i8* %dataptr_as_i849, i8** %datafieldptr51
  store i32 0, i32* %__new_dataptr48
  %x2 = getelementptr inbounds %CObj.9, %CObj.9* %x, i32 0, i32 1
  %x3 = load %CType.12*, %CType.12** %x2
  %x4 = getelementptr inbounds %CType.12, %CType.12* %x3, i32 0, i32 15
  %fn_ptr = load %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)** %x4
  %binop_result = call %CObj.9* %fn_ptr(%CObj.9* %x, %CObj.9* %__new_objptr46)
  %x52 = load %CObj.9*, %CObj.9** @x
  %malloccall53 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr54 = bitcast i8* %malloccall53 to %CObj.9*
  %malloccall55 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr56 = bitcast i8* %malloccall55 to i32*
  %dataptr_as_i857 = bitcast i32* %__new_dataptr56 to i8*
  %ctypefieldptr58 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr54, i32 0, i32 1
  store %CType.12* @ctype_int, %CType.12** %ctypefieldptr58
  %datafieldptr59 = getelementptr inbounds %CObj.9, %CObj.9* %__new_objptr54, i32 0, i32 0
  store i8* %dataptr_as_i857, i8** %datafieldptr59
  store i32 0, i32* %__new_dataptr56
  %x260 = getelementptr inbounds %CObj.9, %CObj.9* %x52, i32 0, i32 1
  %x361 = load %CType.12*, %CType.12** %x260
  %x462 = getelementptr inbounds %CType.12, %CType.12* %x361, i32 0, i32 15
  %fn_ptr63 = load %CObj.9* (%CObj.9*, %CObj.9*)*, %CObj.9* (%CObj.9*, %CObj.9*)** %x462
  %binop_result64 = call %CObj.9* %fn_ptr63(%CObj.9* %x52, %CObj.9* %__new_objptr54)
  %x265 = getelementptr inbounds %CObj.9, %CObj.9* %binop_result64, i32 0, i32 0
  %x366 = load i8*, i8** %x265
  %x467 = bitcast i8* %x366 to i32*
  %data = load i32, i32* %x467
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %data)
  ret i32 0
}

