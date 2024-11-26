// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Tickets_Booking{
    uint private USER_ID;

    enum Time {Morning, Afternoon, Evening}
    enum Type {First_Class, Business_Class, Economy_Class}
    enum Date {First_Day, Second_Day, Last_Day}
    enum Movie {Movie_1, Movie_2, Movie_3}

    struct Bus_Ticket{
        Time time;
        Type types;
        uint Seat_Number;
        uint Book_n_Seats;
    }

    struct AirLine_Ticket{
        Time time;
        Type types;
        uint Seat_Number;
        uint Book_n_Seats;
    }

    struct Cinema_Ticket{
        Time time;
        Movie Movie_Name;
        uint Seat_Number;
        uint Book_n_Seats;
    }

    struct Cricket_Ticket{
        Date date;
        Type types;
        uint Seat_Number;
        uint Book_n_Seats;
    }

    struct Railway_Ticket{
        Time time;
        Type types;
        uint Seat_Number;
        uint Book_n_Seats;
    }

    struct Client{
        uint ID;
        uint Anonomus_ID;
        string Name;
        uint Age;
        address Address;
        
        Bus_Ticket bus_ticket;
        AirLine_Ticket airLine_ticket;
        Cinema_Ticket cinema_ticket;
        Cricket_Ticket cricket_ticket;
        Railway_Ticket railway_ticket;
    }
    Client[] private client;

    /* Perform mapping to build relation between user id and its other attributes
    mapping ( uint => string) Check_Name;
    mapping ( uint => uint) Check_Anonomus_ID;
    mapping ( uint => uint ) Check_Age;
    mapping ( uint => address ) Check_Address;
    */

    // Function to regester User
    function Creat_Account(string memory name, uint age, address addr) public returns (uint, uint){
    client[USER_ID].ID=USER_ID;
    client[USER_ID].Name=name;
    client[USER_ID].Age=age;
    client[USER_ID].Address=addr;
    client[USER_ID].Anonomus_ID=USER_ID * 10;
    USER_ID+=1;
    return ( USER_ID,USER_ID * 10 );
    }

    // Below function checks For the Real Owner
    function Check_AnonomusID(uint Id_Number, uint Anonomus_id) public view returns (bool){
        if(Anonomus_id == client[Id_Number].Anonomus_ID){return true;}
        else{return false;}
    }


    function Book_AirLine_Ticket(uint id, uint anonomus_id, Time Select_Time, Type Select_Type, uint Select_Seat_Number, uint Select_No_Of_seats ) public  returns (string memory){
        string memory Msg;
        bool check = Check_AnonomusID(id, anonomus_id);

        if (check == false){Msg = " You are not the real Owner";}
        else{
                    bool Flag = Book_airLine_Ticket(id, Select_Time, Select_Type, Select_Seat_Number, Select_No_Of_seats);
                if (Flag == true){
                    Msg = "AirLine Ticket Booked Successfully";
                }  
                else{
                    Msg = "Invalid Input ! Ticket Not Booked";
                }
        }
        return Msg;
    }

    function Book_Railway_Ticket(uint id, uint anonomus_id, Time Select_Time, Type Select_Type, uint Select_Seat_Number, uint Select_No_Of_seats ) public  returns (string memory){
        string memory Msg;
        bool check = Check_AnonomusID(id, anonomus_id);

        if (check == false){Msg = " You are not the real Owner";}
        else{
                    bool Flag = Book_railway_Ticket(id, Select_Time, Select_Type, Select_Seat_Number, Select_No_Of_seats);
                if (Flag == true){
                    Msg = "Railway Ticket Booked Successfully";
                }  
                else{
                    Msg = "Invalid Input ! Ticket Not Booked";
                }
        }
        return Msg;
    }

    function Book_Bus_Ticket(uint id, uint anonomus_id, Time Select_Time, Type Select_Type, uint Select_Seat_Number, uint Select_No_Of_seats ) public  returns (string memory){
        string memory Msg;
        bool check = Check_AnonomusID(id, anonomus_id);

        if (check == false){Msg = " You are not the real Owner";}
        else{
                    bool Flag = Book_bus_Ticket(id, Select_Time, Select_Type, Select_Seat_Number, Select_No_Of_seats);
                if (Flag == true){
                    Msg = "Bus Ticket Booked Successfully";
                }  
                else{
                    Msg = "Invalid Input ! Ticket Not Booked";
                }
        }
        return Msg;
    }

    function Book_Cinema_Ticket(uint id, uint anonomus_id, Time Select_Time, Movie Select_Movie_Name, uint Select_Seat_Number, uint Select_No_Of_seats ) public  returns (string memory){
        string memory Msg;
        bool check = Check_AnonomusID(id, anonomus_id);

        if (check == false){Msg = " You are not the real Owner";}
        else{
                    bool Flag = Book_cinema_Ticket(id, Select_Time, Select_Movie_Name, Select_Seat_Number, Select_No_Of_seats);
                if (Flag == true){
                    Msg = "Bus Ticket Booked Successfully";
                }  
                else{
                    Msg = "Invalid Input ! Ticket Not Booked";
                }
        }
        return Msg;
    }

    function Book_Cricket_Ticket(uint id, uint anonomus_id, Date dates, Type Select_Type, uint Select_Seat_Number, uint Select_No_Of_seats ) public  returns (string memory){
        string memory Msg;
        bool check = Check_AnonomusID(id, anonomus_id);

        if (check == false){Msg = " You are not the real Owner";}
        else{
                    bool Flag = Book_cricket_Ticket(id, dates, Select_Type, Select_Seat_Number, Select_No_Of_seats);
                if (Flag == true){
                    Msg = "Bus Ticket Booked Successfully";
                }  
                else{
                    Msg = "Invalid Input ! Ticket Not Booked";
                }
        }
        return Msg;
    }

    // Below function Books ticket bus Tickets 
    function Book_bus_Ticket(uint id, Time timE, Type typE, uint Seat_NO, uint NO_Seats) private returns (bool a ){
    if(timE != Time.Morning && timE != Time.Afternoon && timE != Time.Evening){
                return false;}
    else if( typE != Type.First_Class && typE != Type.Business_Class && typE != Type.Economy_Class){
                return false;}
    else{
    client[id].bus_ticket.time = timE;
    client[id].bus_ticket.types = typE;
    client[id].bus_ticket.Seat_Number = Seat_NO;
    client[id].bus_ticket.Book_n_Seats = NO_Seats;
    return true;

    }
    }

    // Below function Books ticket AirLine Tickets
    function Book_airLine_Ticket(uint id, Time timE, Type typE, uint Seat_NO, uint NO_Seats) private returns (bool a ){
    if(timE != Time.Morning && timE != Time.Afternoon && timE != Time.Evening){
                return false;}
    else if( typE != Type.First_Class && typE != Type.Business_Class && typE != Type.Economy_Class){
                return false;}
    else{
    client[id].airLine_ticket.time = timE;
    client[id].airLine_ticket.types = typE;
    client[id].airLine_ticket.Seat_Number = Seat_NO;
    client[id].airLine_ticket.Book_n_Seats = NO_Seats;
    return true;

    }
    }


    // Below function Books ticket Railway Tickets
    function Book_railway_Ticket(uint id, Time timE, Type typE, uint Seat_NO, uint NO_Seats) private returns (bool a ){
    if(timE != Time.Morning && timE != Time.Afternoon && timE != Time.Evening){
            return false;}
    else if( typE != Type.First_Class && typE != Type.Business_Class && typE != Type.Economy_Class){
                return false;}
    else{
    client[id].railway_ticket.time = timE;
    client[id].railway_ticket.types = typE;
    client[id].railway_ticket.Seat_Number = Seat_NO;
    client[id].railway_ticket.Book_n_Seats = NO_Seats;
    return true;
    }
    }

    // Below function Books Cinema Railway Tickets
    function Book_cinema_Ticket(uint id, Time timE, Movie Movie_name, uint Seat_NO, uint NO_Seats) private returns (bool a ){
    if(timE != Time.Morning && timE != Time.Afternoon && timE != Time.Evening){
                return false;}
    else if( Movie_name != Movie.Movie_1 && Movie_name != Movie.Movie_2 && Movie_name != Movie.Movie_3){
                return false;}
    else{
    client[id].cinema_ticket.time = timE;
    client[id].cinema_ticket.Movie_Name =  Movie_name;
    client[id].cinema_ticket.Seat_Number = Seat_NO;
    client[id].cinema_ticket.Book_n_Seats= NO_Seats;
    return true;
    }
    }

    // Below function Books Cricket Tickets
    function Book_cricket_Ticket(uint id, Date dates, Type typE, uint Seat_NO, uint NO_Seats) private returns (bool a ){
    if(dates != Date.First_Day && dates != Date.Second_Day && dates != Date.Last_Day){
        return false;}
    else if(typE != Type.First_Class && typE != Type.Business_Class && typE != Type.Economy_Class){
        return false;}   
    else{
    client[id].cricket_ticket.date = dates;
    client[id].cricket_ticket.types = typE;
    client[id].cricket_ticket.Seat_Number = Seat_NO;
    client[id].cricket_ticket.Book_n_Seats= NO_Seats;
    return true;

    }
    }


    function Chekck_My_Tickets  ( uint id , uint password) public view returns(Client memory A) {
        if (Check_AnonomusID(id, password) == false){
        }
        else{
            return client[id];
        }

    }
}