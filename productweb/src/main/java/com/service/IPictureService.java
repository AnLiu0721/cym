package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Picture;

public interface IPictureService {
	List<Picture> selectByPKid(Map<String, Object> map);
}
