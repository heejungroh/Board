package com.cos.board.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data //Getter, Setter 합쳐져 있음. + toString()구현되어 있음.
//@Getter
//@Setter
@AllArgsConstructor //전체 파라메터를 가진 생성자
@NoArgsConstructor // 파라메터가 없는 생성자
@Builder //빌더 패턴
@Entity      // object relational mapping(ORM) 가능해짐.
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)   // 해당 데이터베이트 번호증가 전략을 따라가기.

	private int id;
	private String title;
	@Column(length=10000000)
	private String content;
	private int readCount;
	@CreationTimestamp
	private LocalDate createDate = LocalDate.now();
	

}
