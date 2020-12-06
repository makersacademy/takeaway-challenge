# Domain Models


| **Class**      | Dish         |
| **Properties** | name, price  |
| **Actions**    |               |

| **Class**      | Menu         |
| **Properties** | dishes(list)  |
| **Actions**    | see, add_dish |

| **Class**      | Takeaway        |
| **Properties** |   |
| **Actions**    | see_menu, choose, exact_total, place_order |

| **Class**      | Order         |
| **Properties** | order(list), quantities|
| **Actions**    | add, see, total_check, send_text|

| **Class**      | Text         |
| **Properties** | message  |
| **Actions**    | send_a_text |
