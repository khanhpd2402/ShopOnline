document.getElementById("change-password-btn").addEventListener("click", function () {
    var newPasswordGroup = document.getElementById("new-password-group");
    var confirmPasswordGroup = document.getElementById("confirm-password-group");
    var passwordGroup = document.getElementById("password-group");
    var updatePasswordGroup = document.getElementById("update-password-group");
    const button = document.getElementById("change-password-btn");

    if (newPasswordGroup.classList.contains("hidden")) {
        newPasswordGroup.classList.remove("hidden");
        confirmPasswordGroup.classList.remove("hidden");
        passwordGroup.classList.remove("hidden");
        updatePasswordGroup.classList.remove("hidden");
        button.textContent = "Hủy";
    } else {
        newPasswordGroup.classList.add("hidden");
        confirmPasswordGroup.classList.add("hidden");
        passwordGroup.classList.add("hidden");
        updatePasswordGroup.classList.add("hidden");
        button.textContent = "Đổi Mật Khẩu";
    }
});
