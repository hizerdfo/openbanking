package com.personal.kakaologintest.kakaologintest.repository;

import java.util.Objects;

public class UserDTO {
    private String id;
    private String bankcode;
    private String name;
    private String password;
    private String identityNum;
    private String phoneNum;
    private String email;
    private String address;
    private String jibunAddress;
    private String detailAddress;
    private String extraAddress;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBankcode() {
        return bankcode;
    }

    public void setBankcode(String bankcode) {
        this.bankcode = bankcode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdentityNum() {
        return identityNum;
    }

    public void setIdentityNum(String identityNum) {
        this.identityNum = identityNum;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getJibunAddress() {
        return jibunAddress;
    }

    public void setJibunAddress(String jibunAddress) {
        this.jibunAddress = jibunAddress;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getExtraAddress() {
        return extraAddress;
    }

    public void setExtraAddress(String extraAddress) {
        this.extraAddress = extraAddress;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private String postalCode;
    private String grade ;
    private String status ;

    //이메일 이용해서 UserDTO와 비교
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDTO userDTO = (UserDTO) o;
        return Objects.equals(email, userDTO.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(email);
    }
}
