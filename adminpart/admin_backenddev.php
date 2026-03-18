<?php
include 'database.php';
header('Content-Type: application/json');

if (isset($_GET['deleteId'])) {

    $id = intval($_GET['deleteId']);

    mysqli_query($conn,
        "DELETE FROM request_contact 
        WHERE RequestID IN (
            SELECT RequestID 
            FROM relief_request 
            WHERE AffectedUserID = $id
        )"
    );

    mysqli_query($conn,
        "DELETE FROM relief_request 
        WHERE AffectedUserID = $id"
    );

    mysqli_query($conn,
        "DELETE FROM user_contact 
        WHERE UserID = $id"
    );

    mysqli_query($conn,
        "DELETE FROM affected_person 
        WHERE UserID = $id"
    );

    mysqli_query($conn,
        "DELETE FROM admin 
        WHERE UserID = $id"
    );

    $sql = "DELETE FROM user WHERE UserID = $id";

    if (mysqli_query($conn, $sql)) {
        echo "User deleted successfully";
    } else {
        echo "Error: " . mysqli_error($conn);
    }

    exit;
}


if (isset($_GET['userId'])) {

    $id = intval($_GET['userId']);

    $result = mysqli_query($conn,
        "SELECT UserID, FirstName, LastName, UserName, Address, Role 
         FROM user 
         WHERE UserID = $id"
    );

    $user = mysqli_fetch_assoc($result);

    echo json_encode($user);
    exit;
}


if (isset($_GET['action']) && $_GET['action'] == 'summary') {

    $area = $_GET['area'] ?? 'All';
    $reliefType = $_GET['reliefType'] ?? 'Food';

    $userResult = mysqli_query($conn,
        "SELECT COUNT(*) as total FROM user"
    );
    $totalUsers = mysqli_fetch_assoc($userResult)['total'];

    $highResult = mysqli_query($conn,
        "SELECT COUNT(*) as high 
         FROM relief_request 
         WHERE SeverityLevel = 'High'"
    );
    $highRequests = mysqli_fetch_assoc($highResult)['high'];

    if ($area == "All") {

        $typeResult = mysqli_query($conn,
            "SELECT COUNT(*) as count 
             FROM relief_request 
             WHERE ReliefType = '$reliefType'"
        );

    } else {

        $typeResult = mysqli_query($conn,
            "SELECT COUNT(*) as count 
             FROM relief_request 
             WHERE ReliefType = '$reliefType'
             AND District = '$area'"
        );
    }

    $typeCount = mysqli_fetch_assoc($typeResult)['count'];

    $summary = [
        "totalUsers" => $totalUsers,
        "highSeverity" => $highRequests,
        "reliefCount" => $typeCount,
        "typeName" => $reliefType
    ];

    echo json_encode($summary);
    exit;
}

$result = mysqli_query($conn,
    "SELECT UserID, FirstName, LastName, UserName, Address, Role 
     FROM user 
     ORDER BY UserID DESC"
);

$users = [];

while ($row = mysqli_fetch_assoc($result)) {
    $users[] = $row;
}

echo json_encode($users);

mysqli_close($conn);
?>
