// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract StudentRegistry {
   
    // Defining a struct called Student to store student information
    struct Student {
        string name;    // Student's name
        uint age;       // Student's age
        string height;  // Student's height
        string weight;  // Student's weight
    }

    // Dynamic array to store a list of students
    Student[] listOfStudent;

    // Function to add a new student to the registry
    function addStudent(
        string memory _name,  // Name of the student
        string memory _height, // Height of the student
        string memory _weight, // Weight of the student
        uint256 _age          // Age of the student
    ) public {
        // Pushing a new Student struct instance to the listOfStudent array
        listOfStudent.push(
            Student({name: _name, age: _age, height: _height, weight: _weight})
        );
    }

    // Function to edit an existing student's information
    function editStudent(
        uint256 _index,      // Index of the student in the listOfStudent array
        string memory _name, // New name for the student
        uint256 _age,        // New age for the student
        string memory _height, // New height for the student
        string memory _weight // New weight for the student
    ) public {
        require(_index < listOfStudent.length, "Invalid student index"); // Check if the index is valid

        Student storage student = listOfStudent[_index]; // Get the student at the specified index
        student.name = _name;     // Update student's name
        student.age = _age;       // Update student's age
        student.height = _height; // Update student's height
        student.weight = _weight; // Update student's weight
    }

    // Function to view the list of all students registered
    function viewStudentList() 
        public 
        view 
        returns (
            uint256[] memory, // Array of student indices
            uint256[] memory, // Array of student ages
            string[] memory,  // Array of student heights
            string[] memory,  // Array of student weights
            string[] memory   // Array of student names
        )
    {
        uint256 length = listOfStudent.length; // Get the total number of students
        uint256[] memory indices = new uint256[](length); // Dynamic array to store indices of all students
        uint256[] memory ages = new uint256[](length); // Dynamic array to store ages of all students
        string[] memory heights = new string[](length); // Dynamic array to store heights of all students
        string[] memory weights = new string[](length); // Dynamic array to store weights of all students
        string[] memory names = new string[](length); // Dynamic array to store names of all students
        
        for (uint256 i = 0; i < length; i++) { // Loop through all students
            Student storage student = listOfStudent[i]; // Get the student at index i
            indices[i] = i; // Store index of student
            ages[i] = student.age; // Store student's age in ages array
            heights[i] = student.height; // Store student's height in heights array
            weights[i] = student.weight; // Store student's weight in weights array
            names[i] = student.name; // Store student's name in names array
        }
        
        return (indices, ages, heights, weights, names); // Return all arrays with student information
    }
}


